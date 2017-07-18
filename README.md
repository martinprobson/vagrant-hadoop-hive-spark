Vagrant for Hadoop, Spark and Hive
==================================

# Introduction

Vagrant project to spin up a single virtual machine running:

* Hadoop 2.7.3
* Hive 1.2.2
* Spark 2.1.1
* mysql 5.7 (for hive metastore)

The virtual machine will be running the following services:

* HDFS NameNode + DataNode
* YARN ResourceManager/NodeManager + JobHistoryServer + ProxyServer
* Hive metastore and server2
* Spark history server
* mysql

# Getting Started

1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
3. Go to [releases](https://github.com/martinprobson/vagrant-hadoop-hive-spark/releases) and download and extract the latest source of this project.
5. In your terminal change your directory into the project directory (i.e. `cd vagrant-hadoop-spark-hive-<version>`).
6. Run ```vagrant up``` to create the VM.
7. Execute ```vagrant ssh``` to login to the VM.


# Web user interfaces

Here are some useful links to navigate to various UI's:

* YARN resource manager:  (http://10.211.55.101:8088)
* Job history:  (http://10.211.55.101:19888/jobhistory/)
* HDFS: (http://10.211.55.101:50070/dfshealth.html)
* Spark history server: (http://10.211.55.101:18080)
* Spark context UI (if a Spark context is running): (http://10.211.55.101:4040)

# Mysql

mysql database connection 

* `root@10.211.55.101:3306` (for root DBA access - password is 'root') 
* `hive@10.211.55.101:3306` (for hive metastore user - password is 'hive')

# Shared Folder

Vagrant automatically mounts the folder containing the Vagrant file from the host machine into 
the guest machine as `/vagrant` inside the guest.


# Validating your virtual machine setup

To test out the virtual machine setup, and for examples of how to run
MapReduce, Hive and Spark, head on over to [VALIDATING.md](VALIDATING.md).


# Managment of Vagrant VM

To stop the VM and preserve all setup/data within the VM: -

```
vagrant halt
```

or

```
vagrant suspend
```

Issue a `vagrant up` command again to restart the VM from where you left off. See, *starting services* below to restart the
hdfs/yarn/hive and spark daemons.

To completely **wipe** the VM so that `vagrant up` command gives you a fresh machine: -

```
vagrant destroy
```

Then issue `vagrant up` command as usual.

# Starting services in the event of a system restart

If you restart your VM then the Hadoop/Spark/Hive services won't be
up, to bring them up manually use:

```
$ vagrant ssh
$ sudo -sE
$ systemctl start mysql.service
$ /vagrant/scripts/start-hadoop.sh		# Starts the namenode/datanode plus yarn.
$ /vagrant/scripts/start-hive.sh		# Start hiveserver2 plus metastore service.
$ /vagrent/script/start-spark.sh		# Start Spark history server.

```

# To shutdown services cleanly

```
$ vagrant ssh
$ sudo -sE
$ /vagrant/scripts/stop-spark.sh
$ /vagrant/scripts/stop-hadoop.sh
$ systemctl stop mysql.service

```

# Swapspace - Memory

Spark in particular needs quite a bit of memory to run - to work around this a `swapspace` daemon is also configured and
started that uses normal disk to dynamically allocate swapspace when memory is low.


# VIM

A nicer version of vim is also installed, use :PluginInstall to install the plugins from within vim itself.

# More advanced setup

If you'd like to learn more about working and optimizing Vagrant then
take a look at [ADVANCED.md](ADVANCED.md).

# For developers

The file [DEVELOP.md](DEVELOP.md) contains some tips for developers.

# Credits

Thanks to Alex Holmes for the great work at
(https://github.com/alexholmes/vagrant-hadoop-spark-hive)
