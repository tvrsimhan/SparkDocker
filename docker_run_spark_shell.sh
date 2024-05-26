#!/bin/bash

N_WORKERS=$1
if [ -z "$N_WORKERS" ]; then
    N_WORKERS=1
fi

docker-compose up --scale spark-worker=3 -d && docker-compose run -p 4041:4040 --rm spark-shell
