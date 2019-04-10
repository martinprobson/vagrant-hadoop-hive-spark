#!/bin/bash
spark-shell --master yarn \
 --conf "spark.executor.extraClassPath=/usr/local/phoenix/phoenix-4.14.1-HBase-1.4-client.jar:/usr/local/phoenix/phoenix-spark-4.14.1-HBase-1.4.jar"  \
 --conf "spark.driver.extraClassPath=/usr/local/phoenix/phoenix-4.14.1-HBase-1.4-client.jar:/usr/local/phoenix/phoenix-spark-4.14.1-HBase-1.4.jar"  \
 --files "/usr/local/hbase/conf/hbase-site.xml" \
 --jars "/usr/local/phoenix/phoenix-4.14.1-HBase-1.4-client.jar,/usr/local/phoenix/phoenix-spark-4.14.1-HBase-1.4.jar"  \
 --driver-java-options='-Dscala.color'
