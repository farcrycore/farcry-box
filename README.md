# Vagrant Workbench for FarCry Platform

This is a template for vagrant based FarCry development and QA.  Sample project uses the beautiful Chelsea Boots.

# Running the Workbench

Change directory to the root of the project and `vagrant up`.  

Site access:

- http://chelsea.farcrycore.org
- http://chelsea.farcrycore.org/webtop (farcry/farcry)
- http://chelsea.farcrycore.org/railo-context/admin/server.cfm (farcry)
- http://chelsea.farcrycore.org/railo-context/admin/web.cfm (daemon)

(note this is not a real domain -- it's just a local host file reference that's automatically set up but its nicer than an IP address)

To restart Railo server `vagrant ssh` onto the virtual:

```
sudo /etc/init.d/railo_ctl restart
```

The website listens for `*.vagrant.com` host headers so `vagrant share` should work :)

# Setting up the Workbench

## Install the following:

1. VirtualBox: https://www.virtualbox.org/wiki/Downloads
2. Vagrant http://www.vagrantup.com/downloads.html

If you don't have it already, you will need `vagrant-hostmanager` plugin installed for vagrant:

```
vagrant plugin install vagrant-hostmanager
```

## Get project and website code

Checkout this vagrant project into your local workspace (e.g. ~/Projects/vagrant-railo-farcry)

```
git clone https://github.com/farcrycore/vagrant-railo-farcry
cd vagrant-railo-farcry
git submodule update --init
vagrant up
```

## Working with submodules

Don't forget you will need to checkout a specific branch of a submodule in order to commit code to its repo.

```
cd code/core
git checkout p700
```

To update all submodules, change directory to the root of the super project

```
git submodule foreach git pull
```

# Notes

This VM installs the project database from the install files in the project.
Therefore re-exporting and committing the installation files is equivilent to
updating the development environment.

All mail is handled by a postfix process on the VM and synced to 
logs/postfix-vagrant.log once a minute.

# Setting up an alternative FarCry site

To update the config to setup the actual FarCry site:

provisioning/provision.yml
- vars => update sitename, projectdir, domain, dbname

Set up submodules in ./code

README.md
- add info about default login farcry/farcry (provisioning script 
automatically installs project)
