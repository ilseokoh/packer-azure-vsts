# Get Latest base image 
Import-Module -Name AzureRM
Connect-AzureRmAccount
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