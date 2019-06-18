# Dockerd RAGE MP Server
## Avaiable Tags
- RAGE 0.3.7 - .NET Core 3.0 (Preview)
  - `0.3.7-core3`  
  - `core3`  
- RAGE 0.3.7 - .NET Core 2.2
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
  stivik/ragemp-server
```
