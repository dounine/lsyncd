![](https://github.com/dounine/lsyncd/workflows/Publish%20Docker%20image/badge.svg) ![](https://img.shields.io/github/license/dounine/lsyncd)

# lsyncd
## build
```
docker build -t dounine/lsyncd:latest .
```
## demo
```
cd demo && docker-compose up
```
## docker-compose.yaml
```
version: '3'
services:
  lsyncd:
    image: dounine/lsyncd
    volumes:
      - /Users/lake/.ssh/:/root/.ssh/        # Map a local .ssh folder into root
      - /Users/lake/dounine/github/tractor/:/mnt/data/         # Map the local folder to be synchronised
    environment:
      - TARGET_HOST=root@192.168.1.182
      - TARGET_DIR=/root/github/tractor
      - TARGET_PORT=22
      - EXCLUDE_FILE={'**.idea','**.git','**target','project/project'}
    restart:
      always
```

