# Install and Configure "Install-VM"

If you have no linux system, here is how to create one with terraform on a vsphere-environment.

## Install the Install-VM

```bash
# SSH into terraform-host
ssh root@terraform

# Set current Path as variable
mypath=$(pwd)

# Create new working directory and clone Github-Repository
mkdir $mypath/git && cd $mypath/git && git clone https://github.com/Patthecat249/pxe-server.git

# Create new VM with 2x vCPU and 2GB RAM
cd $mypath/git/pxe-server/playbooks && time ansible-playbook 11_create_vm_from_clone.yaml -e "hostname=install-vm cpu=16 ram=16384"
```



## Configure the Install-VM

```bash
# 01 - SSH into new created "install-vm"
ssh root@install-vm

# 02 - Set current Path as variable
mypath=$(pwd)

# 03 - Download and Install git-client and clone Repository
yum install epel-release -y && yum install centos-release-ansible-29.noarch -y && yum install ansible -y && yum install -y git && mkdir $mypath/git && cd $mypath/git && git clone https://github.com/Patthecat249/automated-openshift-installation.git

# 04 - Execute Ansible-Playbook
cd $mypath/git/automated-openshift-installation/ansible/00-install-and-configure-installation-vm/ && ansible-playbook 01-playbook-configure-install-vm.yaml

# 05 - Install-VM is now completly prepared
# 06 - Proceed with the next step "Install a load-balancer"
```





# Next Step

Proceed with Step **Install and Configure a Load-Balancer-VM** 





## Description Install and configure an Install-VM

Mit diesem Playbook wird eine virtuelle Maschine vorbereitet, welche als Ausgangspunkt für die folgende Installation dient. Dies kann in Wirklichkeit ein Linux-Arbeitslaptop eines System-Engineers, oder eine Admin-VM beim Kunden sein, die später dazu verwendet wird, um die OpenShift-Installation und aller benötigten Komponenten zu steuern. 

Wir bezeichnen sie als "Puppenspieler", "Fadenzieher" oder "Ausgangspunkt".

Dieser Rechner hat zum Zeitpunkt der Einrichtung Internet-Zugang!



# Requirements
- VMware 6.7 or newer
- vCenter 6.7 or newer
- Internet-Access from the "Install-VM"
- OS of Install-VM >> e.g. Linux CentOS 7.6 x86_64
- 2 vCPU
- 2048 MB RAM
- 16 GB Thin provisioned disk



# Software
This software packages will be installed through a script

- git
- ansible
- terraform + vsphere-plugin
- epel-release
- centos-release-ansible-29.noarch
- wget
- unzip