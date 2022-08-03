FROM python:3.9.7-slim-buster

ENV PIP_NO_CACHE_DIR 1

RUN sed -i.bak 's/us-west-2\.ec2\.//' /etc/apt/sources.list


    

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y software-properties-common && \
    apt-get install -y python3 python3-pip python3-lxml \
    debian-keyring debian-archive-keyring \
    tzdata p7zip-full p7zip-rar xz-utils wget curl pv jq \
    ffmpeg locales unzip neofetch mediainfo git make g++ gcc automake \
    libxml2-dev libxslt1-dev \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp


# Copy Python Requirements 
WORKDIR /usr/src/bagas
RUN chmod 777 /usr/src/bagas

COPY requirements.txt .
RUN pip3 install -r requirements.txt


RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
