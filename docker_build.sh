#!/bin/bash

docker-compose build
docker-compose push
export TAG=latest
docker-compose build
docker-compose push
