# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "development"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.synced_folder "src", "/home/vagrant/apps", type: "nfs"
  config.vm.synced_folder "db", "/home/vagrant/db", type: "nfs"

  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :private_network, ip: "192.168.40.10"


  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
  end

  config.vm.provision :puppet,
    manifests_path: 'puppet/manifests',
    module_path: 'puppet/modules'

  #Add your personal stuff here
  config.vm.provision :shell, :path => "bootstrap.sh", privileged: false
end
