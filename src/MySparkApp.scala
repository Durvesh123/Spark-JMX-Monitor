import org.apache.spark.sql.SparkSession

val spark = SparkSession.builder()
  .appName("JMX Test App")
  .master("local[2]")
  .getOrCreate()

val data = spark.sparkContext.parallelize(1 to 1000)
val sum = data.reduce(_ + _)
println("✅ Sum = " + sum)

println("⏳ Keeping JVM alive for JMX monitoring...")
Thread.sleep(300000)

spark.stop()
println("🛑 Spark session stopped.")
