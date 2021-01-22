# Install and Configure "Bastion-VM"

## Prerequisite

The Steps **Install an Install-VM** and **Configure an Install-VM** must be completed.



## Install a Bastion-VM

```bash
# Login into install-vm
ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to install a load-balancer
cd $mypath/git/automated-openshift-installation/ansible/03-install-and-configure-bastion-host-vm/ && ansible-playbook 01-playbook-install-bastion-vm.yaml

# Wait a few minutes for the new Bastion-Host-VM
```



## Configure the Bastion-Host-VM

```bash
# SSH into Install-VM
ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to configure the load-balancer
cd $mypath/git/automated-openshift-installation/ansible/03-install-and-configure-bastion-host-vm/ && ansible-playbook 02-playbook-configure-bastion-vm.yaml

# Proceed with the Next Step "Start-OpenShift-Installation"
```

