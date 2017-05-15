# Java (Oracle) 8 (1.8.0_131) JRE server 


Components:

* Oracle Java "1.8.0_131" JRE Runtime Environment for Server
  Java(TM) SE Runtime Environment (build 1.8.0_131-b11)
* Other tools: git wget unzip vim

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

