FROM ubuntu

ENV SHELL /bin/bash
ENV DEBIAN_FRONTEND noninteractive

USER root
RUN apt update \
    && apt install -y git \
    # Python
    python3 python3-pip \
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

# Python Packages
COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install -r requirements.txt



USER 1000

CMD ["/bin/bash"]