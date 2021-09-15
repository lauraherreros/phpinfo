#!/bin/sh

git clone https://github.com/lauraherreros/phpinfo
cd phpinfo
git checkout lauraherreros_santander092021

docker image build \
 --file ./Dockerfile \
 --no-cache \
 --tag local/phpinfo:test \
 
 
docker network create phpinfo
docker container run \
--detach \
--name phpinfo \
--network phpinfo \
--read-only \
--restart always  \
--user nobody \
--volume ./src/:/src/:ro \
--workdir /app/ \
local/phpinfo:test \
