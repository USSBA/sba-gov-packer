FROM hashicorp/packer:light
RUN apk --no-cache update && apk --no-cache upgrade && apk --no-cache add py-pip python && pip install --upgrade pip awscli && rm -rf /var/cache/apk/*
COPY packer-entrypoint /usr/bin/
COPY files/*.json ./
ENTRYPOINT packer-entrypoint
CMD packer-entrypoint

