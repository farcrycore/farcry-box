# -*- mode: ruby -*-
# vi: set ft=ruby :

# Config variables
VAGRANTFILE_API_VERSION = "2"
WEB_SERVER = "192.168.3.55"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define "web" do |web|
    web.ssh.forward_agent = true
    
    web.vm.network :private_network, ip: WEB_SERVER
    
    config.vm.network "forwarded_port", guest: 80, host: 8080
    
    # create/share folders
    if File.exists?('code') == false
      Dir.mkdir('code')
    end

    if File.exists?('logs') == false
      Dir.mkdir('logs')
    end

    web.vm.synced_folder "code/", "/code", mount_options: ["dmode=0777", "fmode=0777"]
    web.vm.synced_folder "logs/", "/logs", mount_options: ["dmode=0777", "fmode=0777"]
    
    web.vm.provision :shell, :path => "provisioning/ansible-run.sh", :args => "/vagrant/provisioning/provision.yml"
    
    web.vm.provider "virtualbox" do |vb|
      web.vm.hostname = "chelsea.farcrycore.org"
      web.hostmanager.aliases = IO.readlines("provisioning/aliases.txt").collect(&:strip)

      vb.customize ["modifyvm", :id, "--memory", "1024", "--natdnshostresolver1", "on"]
    end
  end
end
