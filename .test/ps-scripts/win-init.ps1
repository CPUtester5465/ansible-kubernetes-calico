$Username = "ansible"
$Password = ""

$SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ($Username, $SecurePassword)

Start-Transcript -Path "C:\Users\$Username\Desktop\init_ps.log"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/ansible/ansible/stable-2.10/examples/scripts/ConfigureRemotingForAnsible.ps1' -OutFile "C:\Users\$Username\Desktop\ConfigureRemotingForAnsible.ps1"
Start-Process PowerShell -Credential $Credential -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File C:\Users\$Username\Desktop\ConfigureRemotingForAnsible.ps1"
$scriptBlock = {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
    Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
    choco install git -yes
    Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
    RefreshEnv
}

Start-Process PowerShell -Credential $Credential -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command $scriptBlock"
mkdir C:\Users\$Username\.ssh

ssh-keygen -f C:\Users\ansible\.ssh\id_rsa -t rsa -N '""'

mkdir C:\Users\$Username\repo
