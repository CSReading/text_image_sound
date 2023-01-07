FROM ubuntu

ENV SHELL /bin/bash
ENV DEBIAN_FRONTEND noninteractive

USER root
RUN apt update \
    && apt install -y git \
    # Python
    python3 python3-pip \
    # Open CV
    libgl1 libglib2.0-0 libsm6 libxrender1 libxext6\
    # install Quarto
    curl gdebi-core \
    && curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb \
    && gdebi --non-interactive quarto-linux-amd64.deb


# Create the user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

USER 1000

# Python Path
ENV PYTHONUSERBASE /home/$USERNAME/.pip
ENV PATH $PATH:~/.pip/bin 

CMD ["/bin/bash"]