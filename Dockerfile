FROM docker.io/bitnami/spark:3.3.1

ARG SCALA_VERSION=2.12
ARG DELTA_LAKE_VERSION=2.2.0
ARG SPARK_VERSION=3.3.1
ARG DELTA_PACKAGE=io.delta:delta-core_${SCALA_VERSION}:${DELTA_LAKE_VERSION}

RUN pip install delta-spark==${DELTA_LAKE_VERSION}

RUN echo "spark.jars.packages ${DELTA_PACKAGE}" > $SPARK_HOME/conf/spark-defaults.conf
RUN echo "spark.sql.extensions  io.delta.sql.DeltaSparkSessionExtension" >> $SPARK_HOME/conf/spark-defaults.conf
RUN echo "spark.sql.catalog.spark_catalog org.apache.spark.sql.delta.catalog.DeltaCatalog" >> $SPARK_HOME/conf/spark-defaults.conf
