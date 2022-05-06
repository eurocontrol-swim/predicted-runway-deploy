#!/bin/bash

docker-compose down && \
docker-compose pull && \
docker images | grep none | awk '{print $3}' | xargs -r docker rmi && \
docker-compose up -d
