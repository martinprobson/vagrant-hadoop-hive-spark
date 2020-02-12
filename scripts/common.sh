#!/bin/bash

#
# Version information is defined the versions.sh file
#
source "/vagrant/scripts/versions.sh"

# Curl options
CURL_OPTS="-v -Ss --retry 10 "

# java
JAVA_ARCHIVE=jdk-8u51-linux-x64.gz
JAVA_MYSQL_CONNECTOR_VERSION=5.1.40
JAVA_MYSQL_CONNECTOR_JAR=mysql-connector-java-${JAVA_MYSQL_CONNECTOR_VERSION}.jar
# 
JAVA_MYSQL_CONNECTOR_DOWNLOAD=https://repo.maven.apache.org/maven2/mysql/mysql-connector-java/${JAVA_MYSQL_CONNECTOR_VERSION}/mysql-connector-java-${JAVA_MYSQL_CONNECTOR_VERSION}.jar

# hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hadoop/core/$HADOOP_VERSION/$HADOOP_ARCHIVE
HADOOP_RES_DIR=/vagrant/resources/hadoop

# Yarn
HADOOP_YARN_HOME=$HADOOP_PREFIX

# HBase
HBASE_ARCHIVE=hbase-${HBASE_VERSION}-bin.tar.gz
HBASE_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hbase/${HBASE_VERSION}/$HBASE_ARCHIVE
HBASE_RES_DIR=/vagrant/resources/hbase
HBASE_CONF=/usr/local/hbase/conf
HBASE_PREFIX=/usr/local/hbase
#HIVE_EXEC_JAR=${HIVE_PREFIX}/lib/hive-exec-${HIVE_VERSION}.jar

# Phoenix
PHOENIX_BASE_NAME=apache-phoenix-${PHOENIX_VERSION}
PHOENIX_ARCHIVE=${PHOENIX_BASE_NAME}-bin.tar.gz
PHOENIX_MIRROR_DOWNLOAD=http://www.mirrorservice.org/sites/ftp.apache.org/phoenix/${PHOENIX_BASE_NAME}/bin/${PHOENIX_ARCHIVE}
PHOENIX_RES_DIR=/vagrant/resources/phoenix
PHOENIX_SERVER_JAR=/usr/local/phoenix/phoenix-${PHOENIX_VERSION}-server.jar


# spark
SPARK_ARCHIVE=$SPARK_VERSION-bin-hadoop2.tgz
SPARK_MIRROR_DOWNLOAD=http://archive.apache.org/dist/spark/$SPARK_VERSION/$SPARK_VERSION-bin-hadoop2.7.tgz
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_HOME=/usr/local/spark
SPARK_CONF=${SPARK_HOME}/conf
SPARK_CONF_DIR=${SPARK_CONF}

# ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config

# vim
VIM_RES_DIR=/vagrant/resources/vim

# root password for mysql
MYSQL_ROOT_PASSWORD=root


# Utility functions
function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}
