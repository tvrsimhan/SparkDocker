FROM tvrsimhan27/spark

USER root
RUN apt update \
    && apt install -y curl vim wget software-properties-common net-tools ca-certificates zip unzip build-essential openssl tar iproute2 iputils-* inetutils-tools
RUN export PATH=$SPARK_HOME/bin:$PATH
USER spark_user
