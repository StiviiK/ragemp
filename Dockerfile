FROM debian:latest

ARG DLURL=https://cdn.rage.mp/lin/ragemp-srv.tar.gz

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget -q -O /tmp/ragemp-srv.tar.gz $DLURL && \
    cd /tmp && \
    tar -xzf ragemp-srv.tar.gz && \
    mkdir /home/rage/ && \
    mv ragemp-srv /home/rage/ragemp-srv && \
    cd /home/rage && \
    rm -rf /tmp && \
    chmod +x /home/rage/ragemp-srv

EXPOSE 22005 22006

WORKDIR /home/rage/ragemp-srv
ENTRYPOINT ./server