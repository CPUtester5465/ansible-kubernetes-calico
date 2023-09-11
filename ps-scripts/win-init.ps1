$Username = "ansible"

Start-Transcript -Path "C:\Users\$Username\Desktop\init_ps.log"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ansible/ansible/stable-2.10/examples/scripts/ConfigureRemotingForAnsible.ps1' -OutFile "C:\Users\$Username\Desktop\ConfigureRemotingForAnsible.ps1"
C:\Users\$Username\Desktop\ConfigureRemotingForAnsible.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
choco install git -yes
Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
RefreshEnv
git config --global user.name "test"
git config --global user.email "test@example.com"
mkdir C:\Users\$Username\.ssh

$Password = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($Username, $Password)

Start-Process -FilePath "ssh-keygen" -ArgumentList "-f C:\Users\$Username\.ssh\id_rsa -t rsa -N '""'" -Credential $Credential

mkdir C:\Users\$Username\repo
type C:\Users\$Username\.ssh\id_rsa.pub

# send id_rsa.pub or C:\Users\$Username\Desktop\init_ps.log
