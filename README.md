Vagrant Docker for Hadoop, Spark, HBase and Apache Phoenix 
==========================================================

# Introduction

Vagrant project to spin up a single virtual machine running:

* Hadoop (2.7.6)
* HBase (1.4.8)
* Spark  (2.3.0)
* Apache Phoenix (4.14)

# Version Information
The versions of the above components that the VM is provisioned with are defined in the file `scripts/versions.sh`

# Services
The virtual machine will be running the following services:

* HDFS NameNode + DataNode
* YARN ResourceManager/NodeManager + JobHistoryServer + ProxyServer
* Spark history server
* Hbase server

# Getting Started

1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and/or [Docker](https://www.docker.com/)
2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
3. Clone this repo.
4. Optional - Check the `scripts/versions.sh` file for the versions of the components.
6. In your terminal change your directory into the project directory (i.e. `cd vagrant-hadoop-spark-hive`).
7. Run `vagrant up --provider=virtualbox` to create the VM using virtualbox as a provider. Or run `vagrant up --provider=docker` to use docker as a provider. (**NOTE** *This will take a while the first time as many dependencies are downloaded - subsequent deployments will be quicker as dependencies are cached in the `resources` directory*).
8. Execute ```vagrant ssh``` to login to the VM.

# Work out the ip-address of the docker container
To access the web user interfaces of the various services from your host machine, you need to work out which ip address to connect to. 
To determine this run the following docker commands on the host: -

```
docker container ls

CONTAINER ID        IMAGE                                      COMMAND               CREATED             STATUS              PORTS                                                                                                                    NAMES
a44ca8ded5b8        nishidayuya/docker-vagrant-ubuntu:xenial   "/usr/sbin/sshd -D"   About an hour ago   Up About an hour    0.0.0.0:4040->4040/tcp, 0.0.0.0:8080->8080/tcp, 0.0.0.0:8088->8088/tcp, 0.0.0.0:9083->9083/tcp, 127.0.0.1:2222->22/tcp   vagrant-hadoop-hive-spark_node1_1539427474
```

then

```
docker inspect a44ca8ded5b8 | grep -i ipaddress
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
```

So, in the case above the container's ip address is 172.17.0.2 - you can substitute this address if 'node1' does not work.

# Work out the ip-address of the virtualbox VM
The ip address of the virtualbox machine should be `10.211.55.101`

# Web user interfaces

Here are some useful links to navigate to various UI's:

* YARN resource manager:  (http://node1:8088)
* HBase: (http://node1:16010)
* Job history:  (http://node1:19888/jobhistory/)
* HDFS: (http://node1:50070/dfshealth.html)
* Spark history server: (http://node1:18080)
* Spark context UI (if a Spark context is running): (http://node1:4040)

Substitute the ip address of the container or virtualbox VM for `node1` if necessary.

# Running HBase

HBase should be started when the virtual machine is started, but to shutdown and restart HBase, use the standard scripts in `/usr/local/hbase/bin`

* stop-hbase.sh
* start-hbase.sh

The HBase shell is available via `hbase shell` command.

# Running Apache Phoenix

To access the Phoenix shell, first ensure that HBase is running and then use the sqlline script available in `/usr/local/phoenix/bin`

```
vagrant@node1:~$ /usr/local/phoenix/bin/sqlline.py localhost
Setting property: [incremental, false]
Setting property: [isolation, TRANSACTION_READ_COMMITTED]
issuing: !connect jdbc:phoenix:localhost none none org.apache.phoenix.jdbc.PhoenixDriver
Connecting to jdbc:phoenix:localhost
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/usr/local/apache-phoenix-4.14.1-HBase-1.4-bin/phoenix-4.14.1-HBase-1.4-client.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/usr/local/hadoop-2.7.6/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
19/04/10 10:14:08 WARN util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
Connected to: Phoenix (version 4.14)
Driver: PhoenixEmbeddedDriver (version 4.14)
Autocommit status: true
Transaction isolation: TRANSACTION_READ_COMMITTED
Building list of tables and columns for tab-completion (set fastconnect to true to skip)...
153/153 (100%) Done
Done
sqlline version 1.2.0
0: jdbc:phoenix:localhost>
```

# Accessing Phoenix/HBase from Spark-shell

To access Phoenix tables from the spark-shell, use the following spark shell startup command line: -

```
spark-shell --master yarn \
 --conf "spark.executor.extraClassPath=/usr/local/phoenix/phoenix-4.14.1-HBase-1.4-client.jar:/usr/local/phoenix/phoenix-spark-4.14.1-HBase-1.4.jar"  \
 --conf "spark.driver.extraClassPath=/usr/local/phoenix/phoenix-4.14.1-HBase-1.4-client.jar:/usr/local/phoenix/phoenix-spark-4.14.1-HBase-1.4.jar"  \
 --files "/usr/local/hbase/conf/hbase-site.xml" \
 --jars "/usr/local/phoenix/phoenix-4.14.1-HBase-1.4-client.jar,/usr/local/phoenix/phoenix-spark-4.14.1-HBase-1.4.jar"  \
 --driver-java-options='-Dscala.color'
```

This command line is saved in `/vagrant/scripts/examples/sparkshell.sh`

scala> import org.apache.phoenix.spark._
import org.apache.phoenix.spark._

scala> val r = sc.phoenixTableAsRDD("TEST_TABLE",Seq("ID","COL1"), zkUrl = Some("localhost"))
r: org.apache.spark.rdd.RDD[Map[String,AnyRef]] = MapPartitionsRDD[2] at map at SparkContextFunctions.scala:39

scala> r.count
res0: Long = 3

scala> r.collect.foreach(println)
Map(ID -> 1, COL1 -> 1)
Map(ID -> 2, COL1 -> 2)
Map(ID -> 3, COL1 -> 3)
```

To access the Phoenix shell, first ensure that HBase is running and then use the sqlline script available in `/usr/local/phoenix/bin`

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

Issue a `vagrant up` command again to restart the VM from where you left off.

To completely **wipe** the VM so that `vagrant up` command gives you a fresh machine: -

```
vagrant destroy
```

Then issue `vagrant up` command as usual.

# To shutdown services cleanly

```
$ vagrant ssh
$ sudo -sE
$ /vagrant/scripts/stop-spark.sh
$ /vagrant/scripts/stop-hbase.sh
$ /vagrant/scripts/stop-hadoop.sh

```

# Swapspace - Memory

Spark in particular needs quite a bit of memory to run - to work around this a `swapspace` daemon is also configured and
started that uses normal disk to dynamically allocate swapspace when memory is low.

# Problems
Sometimes the Spark UI is not available from the host machine when running with virtualbox. Setting: -

```bash
 export SPARK_LOCAL_IP=10.211.55.101
 spark-shell .....
```
Seems to solve this.

# More advanced setup

If you'd like to learn more about working and optimizing Vagrant then
take a look at [ADVANCED.md](ADVANCED.md).

# For developers

The file [DEVELOP.md](DEVELOP.md) contains some tips for developers.

# Credits

Thanks to [Alex Holmes](https://github.com/alexholmes) for the great work at
(https://github.com/alexholmes/vagrant-hadoop-spark-hive)

[Matheus Cunha](https://github.com/matheuscunha)
