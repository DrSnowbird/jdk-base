#!/bin/bash -x


# Reference: https://docs.docker.com/engine/userguide/containers/dockerimages/

echo "Usage: "
echo "  ${0} <repo-name/repo-tag>"
echo
imageTag=${1:-openkbs/jre-base}

#instanceName=my-${2:-${imageTag%/*}}_$RANDOM
instanceName=some-${2:-${imageTag##*/}}

echo "(example)"
echo "docker run -d --name some-${imageTag##*/} -t ${imageTag} "
docker run -d --name ${instanceName} -t ${imageTag}

echo ">>> Docker Status"
docker ps -a
echo "-----------------------------------------------"
echo ">>> Docker Shell into Container `docker ps -lq`"
docker exec -it ${instanceName} /bin/bash

