#!/bin/bash
set -uo pipefail

export IMAGE_NAME="sba-gov-centos7-packer"
docker image build -t ${IMAGE_NAME} .
