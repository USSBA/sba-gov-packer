#!/bin/bash
set -uo pipefail
export IMAGE_NAME="ussba/packer-git-awscli"

docker image pull hashicorp/packer:light
docker image build -t ${IMAGE_NAME}:build .


if [[ ! -z "$1" ]]; then
  docker container run --rm -i -t ${IMAGE_NAME}:build /bin/bash
fi
