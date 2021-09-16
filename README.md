# Quick-Start

```bash
# Login into INSTALLVM
ssh root@install-vm

# Set Path-Variable
mypath=${PWD}

# Install Everything (Router, Load-Balancer, Registry, Bootstrap, Master, Worker) with one command
cd $mypath/git/automated-openshift-installation/ansible/00-play-all-in-one/ %% ansible-playbook 01-play-all.yaml
```





# Projektbeschreibung

Diese Script-Sammlung hat zum Ziel voll automatisiert einen OpenShift-Cluster in einer VMware-Umgebung mit vCenter zu installieren. 



# How to read this Guide

Read this Guide and follow step-by-step *(Next step)* . Always follow the instructions in the README-files included in the ansible-folder. 



# Requirements
- vSphere ESXi 6.7 + vCenter 6.7 
- Internet-Access (only for the Install-VM)



# Guide
Everything starts with the creation of an **Install-VM**. This is the central Starting-Point of this guide. This **Install-VM** must be connected to the internet.



# Next step

Start reading the README in `ansible/00-install-and-configure-installation-vm` 

 