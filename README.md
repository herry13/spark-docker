# Spark on Docker

1. Build a Docker image with Delta Lake

   ```
   docker build -t delta-spark:2.2.0 .
   ```

2. Start the Spark cluster

   ```
   docker-compose up -d
   ```

3. Run the Spark application by spinning another container

   `spark-docker_default` is the Spark container's network name
   `spark-driver` is the container name of the Spark driver node


   ```
   docker run \
     -v $(pwd):/mnt \
     --net spark-docker_default \
     -ti delta-spark:2.2.0 \
     spark-submit \
       --master spark://spark-driver:7077 \
       /mnt/pyspark-hello-world.py
   ```

Spark UI -->> http://localhost:8080
