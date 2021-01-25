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



## Sign Certificates

```bash
oc adm certificate approve $(oc get csr | grep -i pending | awk '{print $1}')
```





## Wait for install-complete

```bash
openshift-install --dir=/opt/sva/openshift/install-config/ wait-for install-complete --log-level=debug
```



## Update Image-Registry-Content

```bash
OPENSHIFT_VERSION=4.5.28

/usr/local/bin/oc adm -a /opt/sva/tools/pull-secret release mirror --from=quay.io/openshift-release-dev/ocp-release:$OPENSHIFT_VERSION-x86_64 --to=ocpregistry.openshift.home.local:5000/ocp4/openshift4 --to-release-image=ocpregistry.openshift.home.local:5000/ocp4/openshift4:$OPENSHIFT_VERSION-x86_64
```

