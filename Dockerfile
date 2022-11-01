FROM jupyter/base-notebook:latest

USER root
RUN apt update \
 && apt install -y git

COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install -r requirements.txt

USER 1000