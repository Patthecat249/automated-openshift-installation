# This should be a Rocky-Linux Installation. Tested with Rocky-8.9


mypath=$(pwd)
dnf install epel-release -y
# dnf install centos-release-ansible-29.noarch -y
dnf install ansible -y
dnf install wget -y
dnf install git -y
dnf install unzip -y
dnf install sshpass -y
dnf install jq -y
dnf install -y podman.x86_64
dnf install -y skopeo.x86_64
dnf install -y nfs-utils.x86_64

# Install Terraform
cd $mypath
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

# Create SSH-Keys
ssh-keygen -t rsa -N '' -f /root/.ssh/id_rsa

# Use ssh-keys for passwordless login to localhost
sshpass -f rootpassword ssh-copy-id -i /root/.ssh/id_rsa -o StrictHostKeyChecking=no root@localhost

# Create a User named "ansible"
ansible all -i localhost, -m user -a "name=ansible group=wheel password={{'Test1234' | password_hash('sha512', '')}} generate_ssh_key=yes ssh_key_bits=2048 ssh_key_file=.ssh/id_rsa"


mypath=/home/ansible
# Clone Github-Repository and Type Credentials
mkdir $mypath/git && cd $mypath/git && git config --global credential.helper store && git clone https://github.com/Patthecat249/automated-openshift-installation.git
chown -R ansible:wheel /home/ansible/git
mkdir /opt/sva
chgrp wheel /opt/sva
chmod 775 /opt/sva
echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/wheel
su - ansible
# ssh-copy-id -o StrictHostKeyChecking=no ansible@ansible