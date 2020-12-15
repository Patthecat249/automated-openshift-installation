# Install and Configure "Load-Balancer"

```bash
# Prerequisite: Finish Install-VM

# Execute Playbook to install a load-balancer
cd $mypath/git/automated-openshift-installation/ansible/01-install-and-configure-load-balancer-vm/ && ansible-playbook 01-playbook-install-load-balancer-vm.yaml -e "cpu=2 ram=4096 hostname=ocp-lb ip=10.0.249.111"
```

