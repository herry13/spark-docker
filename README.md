# Spark Docker

```
docker-compose up -d
virtualenv -p python3.8 .venv
. .venv/bin/activate
spark-submit --master spark://localhost:7077 pyspark-hello-world.py
```

Spark UI -->> http://localhost:8080
