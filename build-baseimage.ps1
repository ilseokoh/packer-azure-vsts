Param(
    [string]$latestimagename
)

# & "packer.exe validate -var-file=variable.json -var 'custom_managed_image_name=$latestimagename' .\bdm-baseimage.json"
#& .\packer.exe build $option
$cmdPath = "$PSScriptRoot\packer.exe"
$cmdArgList = @(
	"build",
	# "-debug",
	"-var-file=.\variable.json",
	"-var","custom_managed_image_name=$latestimagename"
	".\bdm-baseimage.json"
)
Write-Output "image name: $latestimagename"
Write-Output "cmd: $cmdPath"
Write-Output "arg: $cmdArgList"

& $cmdPath $cmdArgList