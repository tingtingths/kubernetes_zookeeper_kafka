#!/bin/bash

path="tingtingths/"
name="kafka"
tag="$(cat VERSION)"

echo "Building $path$name:$tag ..."

docker build -t $path$name:$tag .
