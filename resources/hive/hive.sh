#!/bin/sh
export HIVE_HOME=/usr/local/hive
export HIVE_CONF_DIR=$HIVE_HOME/conf
export HCAT_HOME=/usr/local/hive/hcatalog
export PATH=${HIVE_HOME}/bin:${HCAT_HOME}/bin:${PATH}
alias beel='beeline --color=true -u jdbc:hive2://localhost:10000/default;transportMode=http;httpPath=cliservice'
