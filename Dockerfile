FROM jupyter/base-notebook:latest

USER root
RUN apt update \
 && apt install -y git wget \
    # install mecab
    mecab libmecab-dev mecab-ipadic-utf8 mecab-jumandic-utf8 \
    # # package for opencv
    libopencv-dev \
    # play with audio
    pulseaudio ffmpeg sox

COPY requirements.txt .
RUN pip install --upgrade pip \
 && pip install -r requirements.txt

USER 1000