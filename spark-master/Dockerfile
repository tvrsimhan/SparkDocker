FROM tvrsimhan27/spark-base

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /opt/spark/logs

EXPOSE 8080

ENTRYPOINT $SPARK_HOME/bin/spark-class org.apache.spark.deploy.master.Master