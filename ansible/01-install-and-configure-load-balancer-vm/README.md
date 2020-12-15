# Install and Configure "Load-Balancer"

```bash
# SSH into terraform-host
ssh root@install-vm

# Set current Path as variable
mypath=$(pwd)
cd $mypath/git && git clone https://github.com/Patthecat249/automated-openshift-installation.git

# Execute Playbook to install a load-balancer
ansible-playbook 01-playbook-install-load-balancer-vm.yaml -e "hostname=ocp-lb"
```

