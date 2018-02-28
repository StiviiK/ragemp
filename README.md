```
docker run \
        -p 22005:22005/udp \
        -p 22006:22006 \
        -v ~/ragemp_srv/bridge/:/home/rage/bridge/ \
        -v ~/ragemp_srv/client_packages/:/home/rage/client_packages/ \
        -v ~/ragemp_srv/packages/:/home/rage/packages/ \
        -d \
        --name ragemp-server \
        stivik/ragemp-server
```
