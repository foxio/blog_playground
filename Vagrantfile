# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise64"

  # Configurate the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb, override|
    # vb.customize ["modifyvm", :id, "--memory", "2048"]
    # vb.customize ["modifyvm", :id, "--cpus", 4]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    override.vm.network "private_network", ip: "192.168.50.100"
    # override.vm.network "forwarded_port", guest: 3000, host: 4567, auto_correct: true

    override.hostsupdater.remove_on_suspend = true
    override.hostsupdater.aliases = ["blog.dev"]
  end

  config.omnibus.chef_version = :latest

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant", nfs: true

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "ruby_build"
    chef.add_recipe 'rvm::user'
    chef.add_recipe "vim"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"

    # Install Ruby 2.1.2 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json = {
      rvm: {
        rvmrc: {
          rvm_autolibs_flag: "disabled"
        },
        user_installs: [{
          # rubies: ['2.1.5','2.0.0','1.9.3'],
          rubies: ['2.1.5'],
          default_ruby: 'ruby-2.1.5',
          user: 'vagrant',
          code: 'rvm use 2.1.5',
          global_gems: [{name: 'rake'}, {name: 'bundler'}]
          }]
        },
        mysql: {
          server_root_password: ''
        }
      }
    end

    config.vm.provision 'shell', inline: 'echo "cd /vagrant" >> /home/vagrant/.bashrc', privileged: false

  end
