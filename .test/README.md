# ansible-kubernetes-calico

This repository contains Ansible scripts and playbooks for setting up a Kubernetes cluster with Calico networking. The provided scripts simplify the deployment process by automating various tasks involved in configuring both master and worker nodes.

## Prerequisites

Before using these scripts, ensure that you have the following:

- A target environment with the desired master and worker nodes.
- Ansible installed on the machine you'll be running the playbooks from.

## Quick Setup

### ON MASTER

```
curl https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/sh-scripts/master.sh | sudo bash
```

### ON WORKER

```
wget https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/sh-scripts/worker.sh
nano worker.sh
#add master key
sudo bash worker.sh
```

### ON MASTER

```
su ansible-control-panel
cd
cd ansible/
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/cfg/ansible.cfg
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/cfg/hosts.txt

nano hosts.txt
ansible all -m ping
yes
#ping:pong

wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/playbooks/linux/addkeys.yml
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/playbooks/linux/kube-dependencies.yml
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/playbooks/linux/master.yml
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/playbooks/linux/worker.yml

ansible-playbook kube-dependencies.yml
ansible-playbook master.yml
#define keys at addkeys.yml
ansible-playbook addkeys.yml
#define master node IP
ansible-playbook worker.yml
```

ON WIN

```
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ps-scripts/win-init.ps1" -OutFile "$env:TEMP\win.ps1"
Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$env:TEMP\win.ps1`"" -Verb RunAs
```

ON MASTER

```
wget -P /home/ansible-control-panel/repo/ https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/kubelet-service.ps1
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/playbooks/windows/w1.yml
wget -P /home/ansible-control-panel/ansible https://raw.githubusercontent.com/CPUtester5465/ansible-kubernetes-calico/main/ansible/playbooks/windows/w2.yml
```

Disclaimer
