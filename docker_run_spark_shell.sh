#!/bin/bash

sh docker_start_spark.sh 2

docker run -dit --name spark-shell --network spark-network -p 4041:4040 tvrsimhan27/spark-shell
docker attach spark-shell