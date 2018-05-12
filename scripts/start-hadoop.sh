#!/bin/bash

source "/vagrant/scripts/common.sh"

function startDaemons {
    echo "startDaemons: starting namenode"
    $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF --daemon start namenode
    echo "startDaemons: starting datanode"
    $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF --daemon start datanode
    echo "startDaemons: starting resourcemanager"
    $HADOOP_YARN_HOME/bin/yarn --config $HADOOP_CONF --daemon start resourcemanager
    echo "startDaemons: starting nodemanager"
    $HADOOP_YARN_HOME/bin/yarn --config $HADOOP_CONF --daemon start nodemanager
    echo "startDaemons: starting proxyserver"
    $HADOOP_YARN_HOME/bin/yarn --config $HADOOP_CONF --daemon start proxyserver
    echo "startDaemons: starting historyserver"
    $HADOOP_HOME/bin/mapred --config $HADOOP_CONF --daemon start historyserver
    echo "startDaemons: waiting for HDFS to come up"
    # loop until at least HDFS is up
    cmd="$HADOOP_HOME/bin/hdfs dfs -ls /"
    NEXT_WAIT_TIME=0
    up=0
    while [  $NEXT_WAIT_TIME -ne 4 ] ; do
        $cmd
        rc=$?
        if [[ $rc == 0 ]]; then
            up=1
            break
        fi
       sleep $(( NEXT_WAIT_TIME++ ))
    done

    if [[ $up != 1 ]]; then
        echo "HDFS doesn't seem to be up; exiting"
        exit $rc
    fi

    echo "listing all Java processes"
    jps
}

startDaemons
