#!/bin/bash

docker-compose down && \
docker-compose pull && \
docker pull ghcr.io/eurocontrol-swim/predicted-runway-ui:main && \
docker images | grep none | awk '{print $3}' | xargs -r docker rmi && \
docker run -w /app --volume "$(pwd)"/predicted_runway/pr-ui/html/:/app/dist ghcr.io/eurocontrol-swim/predicted-runway-ui:main npm run build && \
docker-compose up -d
