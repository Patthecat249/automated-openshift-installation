# Install and Configure "Load-Balancer"

```bash
# Prerequisite: Finish Install-VM

# Execute Playbook to install a load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-load-balancer-vm/ && ansible-playbook 01-playbook-install-load-balancer-vm.yaml

# Execute initial 
ssh root@ocp-lb-01
useradd -g wheel pi
passwd pi
echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/wheel
exit
ssh-copy-id pi@ocp-lb-01
ssh ocp-lb-01
sudo yum install -y policycoreutils-python
# Execute Playbook to configure the load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-load-balancer-vm/ && ansible-playbook 02-playbook-configure-load-balancer-vm.yaml -k

```

