# Java 8 (1.8.0_92) JRE server + Maven 3.3.9 + PyDev 2.7.11

[![](https://imagelayers.io/badge/openkbs/jre-base:latest.svg)](https://imagelayers.io/?images=openkbs/jre-base:latest 'Get your own badge on imagelayers.io')

Components:

* Oracle Java "1.8.0_92" JRE Runtime Environment for Server
  Java(TM) SE Runtime Environment (build 1.8.0_92-b14)
  Java HotSpot(TM) 64-Bit Server VM (build 25.92-b14, mixed mode)
* Apache Maven 3.3.9
* Python 2.7.11
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 

## Pull the image from Docker Repository

```bash
docker pull openkbs/jre-base
```

## Base the image to build add-on components

```Dockerfile
FROM openkbs/jre-base
```

## Run the image

Then, you're ready to run :

```bash
docker run -d --name my-jre-base -v $PWD/data:/data -i -t openkbs/jre-base
```

## Build and Run your own image

Say, you will build the image "my/jre-base".

```bash
docker build -t my/jre-base .
```

To run your own image, say, with some-jre-base:

```bash
docker run -d --name -t my/jre-base some-jre-base
```

## Shell into the Docker instance
```bash
docker exec -it some-jre-base /bin/bash
```

```

