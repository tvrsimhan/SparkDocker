FROM tvrsimhan27/spark-submit

ENTRYPOINT ["sh", "-c", "$SPARK_HOME/bin/spark-shell --conf spark.executor.memory=2G --conf spark.executor.cores=1 --master spark://spark-master:7077"]