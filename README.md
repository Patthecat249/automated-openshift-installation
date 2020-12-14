# Projektbeschreibung
Diese Scriptsammlung hat zum Ziel voll automatisiert einen OpenShift-Cluster in einer VMware-Umgebung mit vCenter zu installieren. 

# Voraussetzungen
- Es muss entweder eine Linux-VM existieren z.B. CentOS 7.6 - Minimal (Install-Server/Install-VM) oder ein Laptop mit Linux vorhanden sein.

# Anleitung
- Download Github-Repository "pxe-server"
- Erstellen einer Install-VM 
 
# Ablauf zum Erstellung der Install-VM (wenn Install-VM noch nicht existiert) vom Terraform-Host
```bash
ssh terraform
mypath=$(pwd)
mkdir $mypath/git && cd $mypath/git && git clone https://github.com/Patthecat249/pxe-server.git
cd $mypath/git/pxe-server/playbooks && ansible-playbook 11_create_vm_from_clone.yaml -e "hostname=install-vm cpu=2 ram=2048"
```

# Git installieren
```bash
yum install -y git
```

# Download des GIT-Repositories (automated-openshift-installation)
```bash
cd $mypath/git && git clone https://github.com/Patthecat249/automated-openshift-installation.git

```
# Grundkonfiguration der Install-VM
```bash
cd $mypath/git/
```

# Installieren von essentieller Software
- terraform + vsphere-provider plugin
- ansible
- nfsutils
- git