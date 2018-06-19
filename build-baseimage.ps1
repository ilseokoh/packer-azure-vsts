# Azure RM import
Import-Module -Name AzureRM
# Get variable for service principle
$variables = Get-Content '.\variable.json' | Out-String | ConvertFrom-Json
$SecurePassword = $variables.client_secret | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $variables.client_id, $SecurePassword
# login to Azure
Connect-AzureRmAccount -Credential $cred -Tenant $variables.tenant_id -ServicePrincipal

# Get Latest base image 
$latestimagename = (Get-AzureRmResource -ODataQuery "`$filter=tagname eq 'version' and tagvalue eq 'latest'").Name

$cmdPath = "$PSScriptRoot\packer.exe"
$cmdArgList = @(
	"build",
	# "validate",
	# "-debug",
	"-var-file=.\variable.json",
	"-var","custom_managed_image_name=$latestimagename"
	".\baseimage.json"
)

Write-Output "image name: $latestimagename"
Write-Output "cmd: $cmdPath"
Write-Output "arg: $cmdArgList"

& $cmdPath $cmdArgList