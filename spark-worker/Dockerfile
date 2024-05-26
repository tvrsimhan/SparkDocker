FROM tvrsimhan27/spark-base

ENV MASTER_CONTAINER_NAME=spark-master
ENV CORES=3
ENV MEMORY=2G
ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /opt/spark/logs


EXPOSE 8081

ENTRYPOINT $SPARK_HOME/bin/spark-class org.apache.spark.deploy.worker.Worker -c $CORES -m $MEMORY spark://$MASTER_CONTAINER_NAME:7077
