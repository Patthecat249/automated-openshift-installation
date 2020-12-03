[pi@patrick01 install-vm]$ pwd
su - pi 
cd /home/pi/automated-openshift-installation/terraform/install-vm

ansible-playbook 01-playbook-install-vm.yaml -e "hostname=playerone ip=10.0.249.120"
