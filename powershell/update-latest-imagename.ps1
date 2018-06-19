Param(
    [string]$newimagename
)

#update latest-imagename.txt
Write-Output "New Image name: $newimagename"

#remove all tag in the resoruce group 
$current = (Get-AzureRmResource -ODataQuery "`$filter=tagname eq 'version' and tagvalue eq 'latest'")
Set-AzureRmResource -Tag @{ } -ResourceId $current.ResourceId -Force

#set tag to the new image  
$r = Get-AzureRmResource | Where-Object ResourceName -eq $newimagename
Set-AzureRmResource -Tag @{ version="latest"} -ResourceId $r.ResourceId -Force