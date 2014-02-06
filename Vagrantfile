# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "development"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.synced_folder "src", "/home/vagrant"

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

    chef.add_recipe 'vim'
    chef.add_recipe 'rvm'

    chef.json = {
      'rvm' => {
        'user_installs' => {
          'user'         => 'vagrant',
          'default_ruby' => 'ruby-2.1.0',
          'rubies'       => ['2.1.0', '1.9.2-p320']
        }
      },
      "mysql" => {
        "server_root_password" => "",
        "server_debian_password" => "",
        "server_repl_password" => "",
      },
    }

    #configure nginx
    #congigure unicorn
  end
end
