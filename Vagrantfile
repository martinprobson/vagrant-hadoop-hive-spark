# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 1.4.3"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    i = 1
    config.vm.define "node#{i}" do |node|
        node.vm.box = "ubuntu/xenial64"
	config.vm.define :node1 do |t|
        end
        node.vm.provider "virtualbox" do |v|
          v.name = "node#{i}"
          v.customize ["modifyvm", :id, "--memory", "8192"]
        end
        node.vm.network :private_network, ip: "10.211.55.101"
        node.vm.hostname = "node1"

        node.vm.provision "shell", path: "scripts/setup-ubuntu.sh"
        node.vm.provision "shell", path: "scripts/setup-java.sh"
        node.vm.provision "shell", path: "scripts/setup-hadoop.sh"
        node.vm.provision "shell", path: "scripts/setup-hive.sh"
        node.vm.provision "shell", path: "scripts/setup-spark.sh"
        node.vm.provision "shell", path: "scripts/finalize-ubuntu.sh"
    end
end
