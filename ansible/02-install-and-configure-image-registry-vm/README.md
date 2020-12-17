# Install and Configure "Registry-VM"

## Prerequisite

The Steps **Install an Install-VM** and **Configure an Install-VM** must be completed.



## Install a Registry-VM

```bash
# Switch to User pi or ssh pi@install-vm
# install-vm
su - pi
mypath=$(pwd)

# Execute Playbook to install a load-balancer
cd $mypath/git/automated-openshift-installation/ansible/02-install-and-configure-image-registry-vm/ && ansible-playbook 01-playbook-install-registry-vm.yaml

# Wait a few minutes for the new Load-Balancer-VM
```



## Configure the Registry-VM

```bash
# SSH into Install-VM
ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to configure the load-balancer
cd $mypath/git/automated-openshift-installation/ansible/02-install-and-configure-image-registry-vm/ && ansible-playbook 02-playbook-configure-registry-vm.yaml

# Proceed with the Next Step "Install-Bastion-Host-VM"
```

