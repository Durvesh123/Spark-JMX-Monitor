import org.apache.spark.sql.SparkSession

// Use existing Spark session from spark-shell
val data = spark.sparkContext.parallelize(1 to 1000)
val sum = data.reduce(_ + _)
println("✅ Sum = " + sum)

println("⏳ Keeping JVM alive for JMX monitoring...")
Thread.sleep(300000) // 5 minutes

spark.stop()
println("🛑 Spark session stopped.")
