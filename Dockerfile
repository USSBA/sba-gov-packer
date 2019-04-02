FROM hashicorp/packer:light
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add py-pip python git jq curl openssh && \
    pip install --upgrade pip awscli && \
    rm -rf /var/cache/apk/*
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/bin/bash" ]
