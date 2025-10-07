#!/bin/bash

SPARK_HOME=/root/spark-4.0.1-bin-hadoop3
SRC_DIR=../src
JMX_PORT=9999

echo "🚀 Running Spark application with JMX enabled on port $JMX_PORT ..."

$SPARK_HOME/bin/spark-shell \
  --master local[2] \
  --conf "spark.driver.extraJavaOptions=-Dcom.sun.management.jmxremote \
-Dcom.sun.management.jmxremote.port=$JMX_PORT \
-Dcom.sun.management.jmxremote.authenticate=false \
-Dcom.sun.management.jmxremote.ssl=false" \
  -i $SRC_DIR/MySparkApp.scala

echo "✅ Spark application stopped."
