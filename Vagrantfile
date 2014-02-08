# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "development"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.synced_folder "src", "/home/vagrant/apps"

  config.vm.network :forwarded_port, guest: 80, host: 80
  config.vm.network :private_network, ip: "10.10.10.10"


  config.vm.provision :puppet,
    manifests_path: 'puppet/manifests',
    module_path: 'puppet/modules'
end
