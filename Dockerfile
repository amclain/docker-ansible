FROM ubuntu:trusty
MAINTAINER Alex McLain <alex@alexmclain.com>

# Install system packages.
RUN apt-get -qq update && \
    apt-get -y install wget ssh build-essential python-setuptools \
    python-dev libffi-dev libgmp3-dev libssl-dev

RUN easy_install --upgrade setuptools

# Download the Ansible package.
RUN wget -O ansible.tar.gz https://github.com/ansible/ansible/archive/v2.1.0.0-1.tar.gz
RUN tar -xzf ansible.tar.gz
RUN cd ansible-2.1.0.0-1; make; make install
RUN rm ansible.tar.gz
