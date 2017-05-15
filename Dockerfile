# ref: https://github.com/dockerfile/java/tree/master/oracle-java8

# use the latest LTS Ubuntu
FROM ubuntu:xenial

MAINTAINER openkbs

ENV DEBIAN_FRONTEND noninteractive

##### update ubuntu
RUN apt-get update \
  && apt-get install -y curl net-tools build-essential git wget unzip vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

#### Install Java 8
#### Per version variables (Need to find out from http://java.oracle.com site for every update
ARG JAVA_MAJOR_VERSION=8
ARG JAVA_UPDATE_VERSION=131
ARG JAVA_BUILD_NUMBER=11
ARG JAVA_TOKEN=d54c1d3a095b4ff2b6607d096fa80163

ARG UPDATE_VERSION=${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}
ARG BUILD_VERSION=b${JAVA_BUILD_NUMBER}

ENV JAVA_HOME /usr/jdk1.${JAVA_MAJOR_VERSION}.0_${JAVA_UPDATE_VERSION}

ENV PATH $PATH:$JAVA_HOME/bin
RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/${UPDATE_VERSION}-${BUILD_VERSION}/${JAVA_TOKEN}/server-jre-${UPDATE_VERSION}-linux-x64.tar.gz" \
  | gunzip \
  | tar x -C /usr/ \
  && ln -s $JAVA_HOME /usr/java \
  && rm -rf $JAVA_HOME/man

#### Clean up 
RUN apt-get clean

#### define working directory.
WORKDIR /data

