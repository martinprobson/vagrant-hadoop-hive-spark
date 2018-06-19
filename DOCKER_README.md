
# Vagrant Hadoop/Hive/Spark on Docker provisioner

** ------ WARNING WIP ------ **

Git Branch: **docker**

## Summary

This branch contains the changes necessary to get the box running on a docker provisioner: -

1. Changes to the **Vagrantfile** to allow Docker provision.
2. sqoop/flume/zeppelin and pig removed.
3. mysql removed and hive-site.xml changed to revert to Derby rather then mysql metastore (see issues below).
4. Hard coded ip address of `10.211.55.101` removed from all scripts as docker does not support private networking (see issues).

## Running
To use docker as a provider do : -

```bash
    vagrant up --provider=docker
```

```bash
    vagrant up --provider=virtualbox
```

**Note** I have not tested the virtualbox provider against this config - it may not work due to the up address changes.

## Issues

### mysql
Can't get mysql install working in docker container, so have reverted to derby for now.

### ip address
ip address issues - virtualbox provider allows setting up of private network. Docker does not allow this (instead the ip address seems to default
to `172.17.0.2`. This needs more investigation....


Martin Robson 19/06/2018
