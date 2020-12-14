mypath=$(pwd)
yum install epel-release -y
yum install centos-release-ansible-29.noarch -y
yum install ansible -y
yum install wget -y
yum install git -y
yum install unzip -y
yum install sshpass -y
cd $mypath
wget https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_linux_amd64.zip
unzip terraform_0.14.2_linux_amd64.zip
cp terraform /usr/local/bin/terraform
ssh-keygen -t rsa -N ''
ssh-copy-id localhost
ansible all -i localhost, -m user -a "name=pi group=wheel password={{'Test1234' | password_hash('sha512', '')}}"
su - pi
ssh-keygen -t rsa -N ''
ssh-copy-id pi
