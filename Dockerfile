FROM hashicorp/packer:light
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add \
    py-pip \
    python3 \
    git \
    jq \
    curl \
    openssh && \
    pip3 install --upgrade pip awscli && \
    rm -rf /var/cache/apk/*
RUN ln -s /usr/bin/python3.8 /usr/bin/python
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/bin/bash" ]
