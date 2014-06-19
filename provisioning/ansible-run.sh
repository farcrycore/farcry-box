date

ANSIBLE_INSTALLED=`dpkg -s ansible | grep "Status: install ok installed"`

if [ -z "$ANSIBLE_INSTALLED" ] 
then
	(
		apt-get update
		apt-get install -y python-software-properties
		add-apt-repository ppa:rquillo/ansible
		apt-get update
		apt-get install -y ansible
		echo "127.0.0.1" > /etc/ansible/hosts
	) 2>&1 | tee -a /logs/provisioning.log
fi

ansible-playbook -v -c local "$1" --extra-vars "$2" 2>&1 | tee -a /logs/provisioning.log