# Install and Configure "Router-VM"

## Prerequisite

The Steps **Install an Install-VM** and **Configure an Install-VM** must be completed.



## Install a Router-VM

```bash
# Login into install-vm
ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to install a load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-router-vm/ && ansible-playbook 01-playbook-install-router-vm.yaml

# Wait a few minutes for the new router-VM
```



## Configure the Router-Host-VM

```bash
# SSH into Install-VM
ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to configure the load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-router-vm/ && ansible-playbook 02-playbook-configure-router-vm.yaml

# Proceed with the Next Step "Start-OpenShift-Installation"
```

