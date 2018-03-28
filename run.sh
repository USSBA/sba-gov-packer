#!/bin/bash
set -uo pipefail

export IMAGE_NAME="sba-gov-centos7-packer"
docker image build -t ${IMAGE_NAME} .
docker container run --rm -i -t \
-v "/home/${USER}/.aws/:/root/.aws/" \
-e AWS_PROFILE="${1:-default}" \
-e REGION='us-east-1' \
-e SSM_KEY='TEST_AMI' \
-e PACKER_FILE='cis-centos7.json' \
-e TAG="${USER}-cis-centos7" \
${IMAGE_NAME}

