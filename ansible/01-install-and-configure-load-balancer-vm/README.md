# Install and Configure "Load-Balancer"

## Prerequisite

The Steps **Install an Install-VM** and **Configure an Install-VM** must be completed.



## Install a Load-Balancer

```bash
# SSH into Install-VM
ssh pi@install-vm
mypath=$(pwd)
# Execute Playbook to install a load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-load-balancer-vm/ && ansible-playbook 01-playbook-install-load-balancer-vm.yaml

# Wait a few minutes for the new Load-Balancer-VM
```



## Configure a Load-Balancer

```bash
# SSH into Load-Balancer-VM  
ssh root@ocp-lb-01

# Execute some initial-setup-tasks
# Create User PI in group wheel
useradd -g wheel pi

# Set Password "Test1234" for User "pi"
passwd pi

# Allow "sudo" to users in group wheel without typing the password
echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/wheel
exit

# Copy the SSH-KEY from the User "pi" from the Install-VM to the load-balancer
ssh-copy-id pi@ocp-lb-01

# SSH into Load-Balancer-VM
ssh ocp-lb-01

# Install requirements for Python-Library + SELinux
sudo yum install -y policycoreutils-python

# Execute Playbook to configure the load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-load-balancer-vm/ && ansible-playbook 02-playbook-configure-load-balancer-vm.yaml -k
```

