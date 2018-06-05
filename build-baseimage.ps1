# Get image name from text file
$latestimagename = Get-Content .\latest-imagename.txt -Raw
$latestimagename = $latestimagename.Trim()

$cmdPath = "$PSScriptRoot\packer.exe"
$cmdArgList = @(
	"build",
	# "validate",
	# "-debug",
	"-var-file=.\variable.json",
	"-var","custom_managed_image_name=$latestimagename"
	".\bdm-baseimage.json"
)

Write-Output "image name: $latestimagename"
Write-Output "cmd: $cmdPath"
Write-Output "arg: $cmdArgList"

& $cmdPath $cmdArgList