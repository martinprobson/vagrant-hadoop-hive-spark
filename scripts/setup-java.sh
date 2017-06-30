#!/bin/bash
source "/vagrant/scripts/common.sh"

function installRemoteJava {
	echo "install open jdk"
	apt-get install -y openjdk-8-jdk-headless
}

function setupEnvVars {
	echo "creating java environment variables"
     	echo "Setting JAVA_HOME"
	JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
	ln -s ${JAVA_HOME} /usr/local/java
        echo "JAVA_HOME=/usr/local/java" >> /etc/profile.d/java.sh
	echo export PATH=/usr/local/java/bin:\${PATH} >> /etc/profile.d/java.sh
	source /etc/profile.d/java.sh
}

function installJava {
	installRemoteJava
}

echo "setup java"
installJava
setupEnvVars
