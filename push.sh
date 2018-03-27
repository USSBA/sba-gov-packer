#!/bin/bash
set -uo pipefail

# set repository name as variable
export IMAGE_NAME="sba-gov-centos7-packer"

# prompt for an aws profile
read -p "Please enter a profile [default]? " PROFILE
export AWS_PROFILE=${PROFILE:-default}

# create ecr if necessary
aws ecr describe-repositories --repository-names "${IMAGE_NAME}" > /dev/null 2>&1
if [[ "$?" != "0" ]];
then
  aws ecr create-repository --repository-name "${IMAGE_NAME}" > /dev/null
fi

# the script should now stop executing if an error occurs
set -euo pipefail

# registryId
# repositoryName
# repositoryArn
# createdAt
# repositoryUri
export REPOSITORY_NAME=$(aws ecr describe-repositories --repository-names ${IMAGE_NAME} | jq -r '.repositories[0] | .repositoryUri')

# build the docker image
export ECS_LOGIN=$(aws ecr get-login --no-include-email) && $ECS_LOGIN
docker image build -t ${REPOSITORY_NAME} .
docker image push "${REPOSITORY_NAME}"

