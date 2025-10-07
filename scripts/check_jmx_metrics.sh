#!/bin/bash
# ============================================
# Script: check_jmx_metrics.sh
# Purpose: Connect to Spark JMX agent using JMXTerm and display JVM metrics
# ============================================

JMX_PORT=9999
JMXTERM_JAR=jmxterm.jar

# Download JMXTerm if not already present
if [ ! -f "$JMXTERM_JAR" ]; then
  echo "⬇️ Downloading JMXTerm..."
  wget -q https://github.com/jiaqi/jmxterm/releases/latest/download/jmxterm-1.0.4-uber.jar -O $JMXTERM_JAR
  echo "✅ Download complete."
fi

echo
echo "🔍 Connecting to JMX at localhost:$JMX_PORT ..."
echo "--------------------------------------------------"

java -jar $JMXTERM_JAR -l localhost:$JMX_PORT <<EOF
# Memory Metrics
bean java.lang:type=Memory
get HeapMemoryUsage

# Thread Metrics
bean java.lang:type=Threading
get ThreadCount
get PeakThreadCount

# System Metrics
bean java.lang:type=OperatingSystem
get SystemLoadAverage
get AvailableProcessors
get ProcessCpuLoad
get FreePhysicalMemorySize
get TotalPhysicalMemorySize

quit
EOF

echo "--------------------------------------------------"
echo "✅ JMX metrics retrieved successfully."
