FROM ubuntu:14.04
MAINTAINER Ash Wilson

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    vim \
    curl \
    gcc \
    build-essential \
    patch \
    zlib1g-dev \
    liblzma-dev \
    ruby2.0-dev

RUN curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -P chefdk -v 0.9.0

RUN mkdir /cookbooks && \
    cd /cookbooks && \
    git clone https://github.com/cloudpassage/cloudpassage-chef-cookbook.git && \ 
    cd cloudpassage-chef-cookbook && \
    chef exec bundle install
