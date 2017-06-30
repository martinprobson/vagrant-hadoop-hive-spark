#!/bin/bash

source "/vagrant/scripts/common.sh"

function startHive {
    echo "starting Hive daemons"
    export HADOOP_HOME=${HADOOP_PREFIX}
    nohup ${HIVE_PREFIX}/bin/hive --service metastore < /dev/null > /usr/local/hive/logs/hive_metastore_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &
    nohup ${HIVE_PREFIX}/bin/hive --service hiveserver2 < /dev/null > /usr/local/hive/logs/hive_server2_`date +"%Y%m%d%H%M%S"`.log 2>&1 </dev/null &
    echo "listing all Java processes"
    jps
}

startHive     
