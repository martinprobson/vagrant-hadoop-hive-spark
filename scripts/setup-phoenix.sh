#!/bin/bash

source "/vagrant/scripts/common.sh"

function installLocalPhoenix {
	echo "install Phoenix from local file"
	FILE=/vagrant/resources/$PHOENIX_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function installRemotePhoenix {
	echo "install Phoenix from remote file"
	curl ${CURL_OPTS} -o /vagrant/resources/$PHOENIX_ARCHIVE -O -L $PHOENIX_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$PHOENIX_ARCHIVE -C /usr/local
}

function installPhoenix {
	if resourceExists $PHOENIX_ARCHIVE; then
		installLocalPhoenix
	else
		installRemotePhoenix
	fi
	ln -s /usr/local/${PHOENIX_BASE_NAME}-bin /usr/local/phoenix
}

function setupPhoenix {
	echo "Copying phoenix server jar"
	cp -f ${PHOENIX_SERVER_JAR} ${HBASE_PREFIX}/lib/.
}

function setupEnvVars {
	echo "creating phoenix environment variables"
}

echo "setup phoenix"
# Phoenix
#PHOENIX_BASE_NAME=apache-phoenix-${PHOENIX_VERSION}
#PHOENIX_ARCHIVE=${PHOENIX_BASE_NAME}-bin.tar.gz
#PHOENIX_MIRROR_DOWNLOAD=http://www.mirrorservice.org/sites/ftp.apache.org/phoenix/${PHOENIX_BASE_NAME}/bin/${PHOENIX_ARCHIVE}
#PHOENIX_RES_DIR=/vagrant/resources/phoenix
echo "PHOENIX_BASE_NAME = $PHOENIX_BASE_NAME"
echo "PHOENIX_ARCHIVE = ${PHOENIX_BASE_NAME}-bin.tar.gz"
echo "PHOENIX_MIRROR_DOWNLOAD =  ${PHOENIX_MIRROR_DOWNLOAD}"
echo "PHOENIX_RES_DIR = ${PHOENIX_RES_DIR}"

installPhoenix
setupPhoenix
setupEnvVars

echo "phoenix setup complete"
