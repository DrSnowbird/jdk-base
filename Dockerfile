# ref: https://github.com/dockerfile/java/tree/master/oracle-java8

# use the latest LTS Ubuntu
FROM ubuntu:xenial

MAINTAINER openkbs.org@gmail.com

ENV DEBIAN_FRONTEND noninteractive

##### update ubuntu
RUN apt-get update \
  && apt-get install -y curl net-tools build-essential git wget unzip vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

#### Install Java 8
#### ---------------------------------------------------------------
#### ---- Change below when upgrading version ----
#### ---------------------------------------------------------------
ARG JAVA_MAJOR_VERSION=${JAVA_MAJOR_VERSION:-8}
ARG JAVA_UPDATE_VERSION=${JAVA_UPDATE_VERSION:-162}
ARG JAVA_BUILD_NUMBER=${JAVA_BUILD_NUMBER:-12}
ARG JAVA_TOKEN=${JAVA_TOKEN:-0da788060d494f5095bf8624735fa2f1}

## http://download.oracle.com/otn-pub/java/jdk/8u162-b12/0da788060d494f5095bf8624735fa2f1/jdk-8u162-linux-x64.tar.gz

#### ---------------------------------------------------------------
#### ---- Don't change below unless you know what you are doing ----
#### ---------------------------------------------------------------
ARG UPDATE_VERSION=${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}
ARG BUILD_VERSION=b${JAVA_BUILD_NUMBER}

ENV JAVA_HOME /usr/jdk1.${JAVA_MAJOR_VERSION}.0_${JAVA_UPDATE_VERSION}
ENV PATH $PATH:$JAVA_HOME/bin
ENV INSTALL_DIR /usr

RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/${UPDATE_VERSION}-${BUILD_VERSION}/${JAVA_TOKEN}/jdk-${UPDATE_VERSION}-linux-x64.tar.gz" \
  | gunzip \
  | tar x -C $INSTALL_DIR/ \
  && ln -s $JAVA_HOME $INSTALL_DIR/java \
  && rm -rf $JAVA_HOME/man

#### Clean up 
RUN apt-get clean

#### define working directory.
WORKDIR /data

