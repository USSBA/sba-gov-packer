#!/bin/bash
set -uo pipefail

export IMAGE_NAME="sba-gov-centos7-packer"
docker image build -t ${IMAGE_NAME} .
docker container run --rm -i -t \
-v "/home/${USER}/.aws/:/root/.aws/" \
-e AWS_PROFILE='sba-dev' \
-e REGION='us-east-1' \
-e SSM_KEY='TEST_AMI' \
-e PACKER_FILE='cis-centos7.json' \
-e TAG='XJASONX-cis-centos7' \
${IMAGE_NAME}

