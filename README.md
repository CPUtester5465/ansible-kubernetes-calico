# ansible-kubernetes-calico
*ON MASTER*

curl https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/sh-scripts/master.sh | sudo bash

*ON WORKER*

wget https://github.com/CPUtester5465/ansible-kubernetes-calico/blob/main/sh-scripts/worker.sh
nano worker.sh
#add master key 
sudo bash worker.sh 

#######################################

*ON MASTER*
su ansible-control-panel
cd
cd ansible/
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/cfg/ansible.cfg
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/cfg/hosts.txt

nano hosts.txt
ansible all -m ping
yes
#ping:pong
