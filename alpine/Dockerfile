FROM alpine

ARG SERVER_URL=https://cdn.rage.mp/lin/ragemp-srv.tar.gz
ARG BRIDGE_URL=http://cdn.gtanet.work/bridge-package-linux.tar.gz

# Install dependencies
RUN apk update
RUN apk add \
    icu-dev \
    curl \
    openssl-dev \
    strace

# Add rage user
RUN adduser --disabled-password --gecos "" rage
RUN mkdir -p /home/rage/server

# Download required packages
RUN mkdir /tmp/server/
RUN cd /tmp/server && \
    curl $SERVER_URL -o ragemp-srv.tar.gz && \
    tar -xzf ragemp-srv.tar.gz && \
    mv -v ragemp-srv/* /home/rage/server && \
    rm -rf /tmp/server

RUN mkdir /tmp/bridge/
RUN cd /tmp/bridge && \
    curl $BRIDGE_URL -o bridge-package-linux.tar.gz  && \
    tar -xzf bridge-package-linux.tar.gz && \
    mv -v plugins/* /home/rage/server/plugins && \
    rm -rf /tmp/bridge

# Expose Ports and start the Server
WORKDIR /home/rage/server
RUN chown -R rage:rage .
EXPOSE 22005/udp 22006

ADD ./entrypoint.sh ./entrypoint.sh
RUN chmod +x server
RUN chmod +x entrypoint.sh

USER rage
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
