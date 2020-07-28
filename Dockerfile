FROM hashicorp/packer:light
RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add py-pip && \
    apk --no-cache add python3 && \
    apk --no-cache add git && \
    apk --no-cache add jq && \
    apk --no-cache add curl && \
    apk --no-cache add openssh && \
    pip3 install --upgrade pip awscli && \
    rm -rf /var/cache/apk/*
RUN cd /usr/bin/ && \
    ln -s python3.8 python
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/bin/bash" ]
