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
# define JAVA_HOME variable
ENV JAVA_HOME /usr/jdk1.8.0_92
ENV PATH $PATH:$JAVA_HOME/bin
RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/8u92-b14/server-jre-8u92-linux-x64.tar.gz" \
  | gunzip \
  | tar x -C /usr/ \
  && ln -s $JAVA_HOME /usr/java \
  && rm -rf $JAVA_HOME/man

#### Clean up 
RUN apt-get clean

#### define working directory.
WORKDIR /data

