Start-Transcript -Path "C:\Users\Administrator\Desktop\init_ps.log"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ansible/ansible/stable-2.10/examples/scripts/ConfigureRemotingForAnsible.ps1' -OutFile 'ConfigureRemotingForAnsible.ps1'
.\ConfigureRemotingForAnsible.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
choco install git -yes
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
RefreshEnv
git config --global user.name "test"
git config --global user.email "test@example.com"
ssh-keygen -f C:\Users\Administrator/.ssh/id_rsa -t rsa -N '""'
mkdir C:\Users\Administrator\repo
type C:\Users\Administrator\.ssh\id_rsa.pub
# send id_rsa.pub or C:\Users\Administrator\Desktop\init_ps.log

###PORTS, Users, why crictl didnt download
