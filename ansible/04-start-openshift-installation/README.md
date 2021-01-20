# Install and Configure "OpenShift-VMs"


## Install the OpenShift-VMs

```bash
# Login into install-vm
ssh root@install-vm
mypath=$(pwd)

# Execute Playbook to install the Master/Worker-Nodes
cd $mypath/git/automated-openshift-installation/ansible/04-start-openshift-installation/ && ansible-playbook 01-create-bootstrap.yaml
cd $mypath/git/automated-openshift-installation/ansible/04-start-openshift-installation/ && ansible-playbook 02-create-master01.yaml
cd $mypath/git/automated-openshift-installation/ansible/04-start-openshift-installation/ && ansible-playbook 03-create-master02.yaml
cd $mypath/git/automated-openshift-installation/ansible/04-start-openshift-installation/ && ansible-playbook 04-create-master03.yaml
cd $mypath/git/automated-openshift-installation/ansible/04-start-openshift-installation/ && ansible-playbook 05-create-worker01.yaml
cd $mypath/git/automated-openshift-installation/ansible/04-start-openshift-installation/ && ansible-playbook 06-create-worker02.yaml
cd $mypath/git/automated-openshift-installation/ansible/04-start-openshift-installation/ && ansible-playbook 07-create-worker03.yaml
```

## Wait for bootstrap-complete
```bash
openshift-install --dir=/opt/sva/openshift/install-config/ wait-for bootstrap-complete --log-level=debug
```

## Wait for install-complete
```bash
openshift-install --dir=/opt/sva/openshift/install-config/ wait-for install-complete --log-level=debug
```
