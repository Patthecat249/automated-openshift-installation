# Install and Configure "Load-Balancer"

## Prerequisite

The Steps **Install an Install-VM** and **Configure an Install-VM** must be completed.



## Install a Load-Balancer

```bash
# ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to install a load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-load-balancer-vm/ && ansible-playbook 01-playbook-install-lb-vm.yaml

# Wait a few minutes for the new Load-Balancer-VM
```



## Configure a Load-Balancer

```bash
# SSH into Install-VM
ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to configure the load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-load-balancer-vm && ansible-playbook 02-playbook-configure-load-balancer-vm.yaml

# Proceed with the Next Step "Install-Registry-VM"
```

