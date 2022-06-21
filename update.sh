#!/bin/bash

docker-compose down && \
docker-compose pull && \
docker images | grep none | awk '{print $3}' | xargs -r docker rmi && \
mkdir -p /data/pr-ui/html && \
docker run -w /app --volume /data/pr-ui/html/:/app/dist ghcr.io/eurocontrol-swim/predicted-runway-ui:main npm run build && \
docker-compose up -d
