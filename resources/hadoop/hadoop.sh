#!/bin/sh

export HADOOP_HOME=/usr/local/hadoop
export HADOOP_YARN_HOME=${HADOOP_HOME}
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop
export YARN_LOG_DIR=${HADOOP_YARN_HOME}/logs
export YARN_IDENT_STRING=root
export HADOOP_MAPRED_IDENT_STRING=root
export HADOOP_MAPRED_HOME=${HADOOP_HOME}
export PATH=${HADOOP_HOME}/bin:${PATH}
