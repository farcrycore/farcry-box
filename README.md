# Setting up the VM

1. Install VirtualBox
2. Install Vagrant
3. Checkout this vagrant project (e.g. /vms/bng-vagrant-spp)
4. In the vagrant root, run `vagrant plugin install vagrant-hostmanager`
   NOTE: this must be done for each vagrant project - it is not something
   you can do once for your machine.
5. In the vagrant root, run `fc-deploy.sh init provisioning/fcdeploy.txt`
6. In the vagrant root, run `vagrant up`

You will be able to access the website on [spp.bng.daemonite.com].

# Notes

This VM installs the project database from the install files in the project.
Therefore re-exporting and committing the installation files is equivilent to
updating the development environment.

All mail is handled by a postfix process on the VM and synced to 
logs/postfix-vagrant.log once a minute.