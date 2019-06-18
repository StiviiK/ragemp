# Dockerd RAGE MP Server on [Docker Hub](http://hub.docker.com/r/stivik/ragemp)

## Available Tags
- [RAGE 0.3.7](https://github.com/StiviiK/ragemp/tree/0.3.7)
  - .NET Core 3.0 (Preview)
    - `0.3.7-core3`  
    - `core3`  
  - .NET Core 2.2
    - `0.3.7-core2`
    - `core2`
    - `latest`

## Example: blank server
```
docker run \
  -p 22005:22005/udp \
  -p 22006:22006 \
  -d \
  --name ragemp-server \
  stivik/ragemp
```
