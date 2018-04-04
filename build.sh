#!/bin/bash
set -uo pipefail
export IMAGE_NAME="ussba/packer-git-awscli"

docker image pull hashicorp/packer:light
docker image build -t ${IMAGE_NAME} .
