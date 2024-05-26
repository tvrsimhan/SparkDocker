#!/bin/bash

N_WORKERS=$1
if [ -z "$N_WORKERS" ]; then
    N_WORKERS=1
fi

# Start master
docker run -dit --name spark-master --network spark-network -p 8081:8080 tvrsimhan27/spark-master --attach

# Start worker nodes
for i in `seq 1 $N_WORKERS`
do
    docker run -dit --name "spark-worker${i}" --network spark-network -p "809${i}:8081" -e MEMORY=2G -e CORES=1 tvrsimhan27/spark-worker 
done

docker run -dit --name spark-submit --network spark-network -p 4040:4040 tvrsimhan27/spark-submit bash
