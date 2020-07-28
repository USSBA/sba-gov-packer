#!/bin/bash
set -uo pipefail
export IMAGE_NAME="ussba/packer-git-awscli"

docker image pull hashicorp/packer:light
docker image build -t ${IMAGE_NAME}:build .

#docker container run --rm -i -t ${IMAGE_NAME}:build /bin/bash
#docker image tag ussba/packer-git-awscli:build ussba/packer-git-awscli:latest
#docker login
#docker image push ussba/packer-git-awscli:latest
