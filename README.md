# Java (Oracle) 8 (1.8.0_162) Java JDK
[![](https://images.microbadger.com/badges/image/openkbs/jdk-base.svg)](https://microbadger.com/images/openkbs/jdk-base "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/jdk-base.svg)](https://microbadger.com/images/openkbs/jdk-base "Get your own version badge on microbadger.com")
Components:

* Oracle Java "1.8.0_162" JDK
* Other tools: git wget unzip vim

## Test Run
```
./run.sh
```

## Run with options

```bash
docker run -d --name my-jdk-base -v $PWD/data:/data -i -t openkbs/jdk-base
```

## Pull the image from Docker Repository

```bash
docker pull openkbs/jdk-base
```

## Build with add-on components

```Dockerfile
FROM openkbs/jdk-base
```

## Build
If you want to build your local image instead of using pre-built ready-to-run images

Say, you will build the image "my/jdk-base".

```bash
docker build -t my/jdk-base .
```

To run your own image, say, with some-jdk-base:

```bash
docker run -d --name -t my/jdk-base some-jdk-base
```

## Shell into the Docker instance
```bash
docker exec -it some-jdk-base /bin/bash


