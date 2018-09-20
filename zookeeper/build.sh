#!/bin/bash

path="tingtingths/"
name="zookeeper"
tag="$(cat VERSION)"

echo "Building $path$name:$tag ..."

docker build -t $path$name:$tag .
