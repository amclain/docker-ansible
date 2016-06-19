FROM ubuntu:trusty
MAINTAINER Alex McLain <alex@alexmclain.com>

# Install system packages.
RUN apt-get -qq update && \
    apt-get -y install curl wget ssh build-essential python-setuptools \
    python-dev libffi-dev libgmp3-dev libssl-dev

RUN easy_install --upgrade setuptools

# Download the Ansible package.
RUN wget -O ansible.tar.gz http://releases.ansible.com/ansible/ansible-2.1.0.0.tar.gz
RUN tar -xzf ansible.tar.gz
RUN rm ansible.tar.gz
RUN cd ansible-2.1.0.0; make; make install
