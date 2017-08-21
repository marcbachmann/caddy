#!/usr/bin/env bash
set -eu
# $ARCH one of 386, amd64, arm5, arm6, arm7, arm64
ARCHS=$(echo ${ARCHS:-amd64} | tr ',' ' ')
TAGS=$(echo ${TAGS:-latest} | tr ',' ' ')
SET=${SET:-raw}

# $PLUGINS is a comma separated list of plugins listed in the caddy documentation
# https://caddyserver.com/docs
PLUGINS=${PLUGINS:-}

buildArch () {
  local arch=$1
  echo Download and extract caddy for ARCH $arch with plugins \'$PLUGINS\'
  mkdir -p ./tmp
  curl https://caddyserver.com/download/linux/$arch | tar -C ./tmp -xz caddy
  chmod +x ./tmp/caddy
  echo Build caddy image...
  docker build -t caddy .
  for tag in $TAGS; do docker tag caddy marcbachmann/caddy:$tag-$arch-$SET; done
  rm -Rf ./tmp
}

for arch in $ARCHS; do buildArch $arch; done
