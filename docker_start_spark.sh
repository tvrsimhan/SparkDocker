#!/bin/bash

N_WORKERS=$1
if [ -z "$N_WORKERS" ]; then
    N_WORKERS=1
fi

docker run -dit --name spark-master --network spark-network -p 8081:8080 tvrsimhan27/spark-master

for i in `seq 1 $N_WORKERS`
do
    docker run -dit --name "spark-worker${i}" --network spark-network -p "809${i}:8080" -e MEMORY=2G -e CORES=1 tvrsimhan27/spark-worker
done
