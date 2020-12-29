FROM centos/nodejs-8-centos7
MAINTAINER truonggiangle91@gmail.com
USER root

RUN localedef --quiet -c -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


RUN yum install -y \
        yum-utils \
        curl \
        git \
        tmux \
        vim \
        nano \
        wget \
        telnet \
        gcc \
        emacs-nox
RUN yum groupinstall -y "Development Tools" 
RUN yum clean -y all
RUN wget https://bintray.com/loadimpact/rpm/rpm -O bintray-loadimpact-rpm.repo
RUN mv bintray-loadimpact-rpm.repo /etc/yum.repos.d/
RUN yum install -y k6