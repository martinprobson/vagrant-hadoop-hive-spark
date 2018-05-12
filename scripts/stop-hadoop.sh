#!/bin/bash

source "/vagrant/scripts/common.sh"

function stopDaemons {
    echo "stopDaemons: stopping historyserver"
    $HADOOP_HOME/bin/mapred --config $HADOOP_CONF --daemon stop historyserver
    echo "stopDaemons: stopping proxyserver"
    $HADOOP_YARN_HOME/bin/yarn --config $HADOOP_CONF --daemon stop proxyserver
    echo "stopDaemons: stopping nodemanager"
    $HADOOP_YARN_HOME/bin/yarn --config $HADOOP_CONF --daemon stop nodemanager
    echo "stopDaemons: stopping resourcemanager"
    $HADOOP_YARN_HOME/bin/yarn --config $HADOOP_CONF --daemon stop resourcemanager
    echo "stopDaemons: stopping datanode"
    $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF --daemon stop datanode
    echo "stopDaemons: stopping namenode"
    $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF --daemon stop namenode
    echo "listing all Java processes"
    jps
}

stopDaemons
