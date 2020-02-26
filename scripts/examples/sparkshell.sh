#!/bin/bash
spark-shell --master yarn \
 --files "/usr/local/hbase/conf/hbase-site.xml" \
 --driver-java-options='-Dscala.color'
