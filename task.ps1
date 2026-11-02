$resourceGroupName = "mate-azure-task-5"

$unattachedDisks = Get-AzDisk -ResourceGroupName $resourceGroupName |
    Where-Object { $_.DiskState -eq "Unattached" }

$unattachedDisks | ConvertTo-Json | Out-File -FilePath "$PWD/result.json"