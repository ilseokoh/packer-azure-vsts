Param(
    [string]$newimagename
)

# Azure RM import
Import-Module -Name AzureRM
# Get variable for service principle
$variables = Get-Content '.\variable.json' | Out-String | ConvertFrom-Json
$SecurePassword = $variables.client_secret | ConvertTo-SecureString -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $variables.client_id, $SecurePassword
# login to Azure
Connect-AzureRmAccount -Credential $cred -Tenant $variables.tenant_id -ServicePrincipal


#update latest-imagename.txt
Write-Output "New Image name: $newimagename"

#remove all tag in the resoruce group 
$current = (Get-AzureRmResource -ODataQuery "`$filter=tagname eq 'version' and tagvalue eq 'latest'")
Set-AzureRmResource -Tag @{ } -ResourceId $current.ResourceId -Force

#set tag to the new image  
$r = Get-AzureRmResource | Where-Object ResourceName -eq $newimagename
Set-AzureRmResource -Tag @{ version="latest"} -ResourceId $r.ResourceId -Force