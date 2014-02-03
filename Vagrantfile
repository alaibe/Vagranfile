# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "development"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]
    chef.data_bags_path = "data_bags"

    chef.add_recipe 'apt'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'git'
    chef.add_recipe 'imagemagick'
    chef.add_recipe 'curl'

    chef.add_recipe 'nginx'

    chef.add_recipe 'mysql::server'
    chef.add_recipe 'mysql::client'
    chef.add_recipe 'mongodb::10gen_repo'
    chef.add_recipe 'mongodb::default'

    chef.add_recipe 'memcached'
    chef.add_recipe 'redis'

    chef.add_recipe 'tmux'
    chef.add_recipe 'vim'
    chef.add_recipe 'emacs'
    chef.add_recipe 'zsh'
    chef.add_recipe 'dotfiles'

    chef.json = {
      "mysql" => {
        "server_root_password" => "",
        "server_debian_password" => "",
        "server_repl_password" => "",
      },
      "dotfiles" => {
        "user" => "vagrant",
        "group" => "vagrant",
        "public_key" => IO.read(File.expand_path("~/.ssh/id_rsa.pub")),
        "private_key" => IO.read(File.expand_path("~/.ssh/id_rsa"))
      },
      "user" => "alaibe"
    }
  end
end
