FROM debian:stretch

ARG SERVER_URL=https://cdn.rage.mp/lin/ragemp-srv.tar.gz
ARG BRIDGE_URL=http://cdn.gtanet.work/bridge-package-linux.tar.gz

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget curl libunwind8 gettext apt-transport-https gnupg2 && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    apt-get update && \
    apt-get install -y dotnet-sdk-2.0.0 && \
    rm -rf /var/lib/apt/lists/*


# Download required packages
RUN mkdir /home/rage/ && \
    mkdir /tmp/server/
RUN cd /tmp/server && \
    wget -q $SERVER_URL && \
    tar -xzf ragemp-srv.tar.gz && \
    mv -v ragemp-srv/* /home/rage && \
    cd / && \
    rm -rf /tmp/server

RUN mkdir /tmp/bridge/
RUN cd /tmp/bridge && \
    wget -q $BRIDGE_URL && \
    tar -xzf bridge-package-linux.tar.gz && \
    rm bridge-package-linux.tar.gz && \
    mv -v * /home/rage && \
    cd / && \
    rm -rf /tmp/bridge


# Expose Ports and start the Server
WORKDIR /home/rage
EXPOSE 22005/udp 22006

RUN chmod +x server
ENTRYPOINT ./server