$resourceGroupName = "mate-azure-task-5"
$vmName = "VM_NAME"
$diskName = "DISK_NAME"

# Отримуємо конфігурацію VM
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

# Від'єднуємо data disk від VM
$vm = Remove-AzVMDataDisk -VM $vm -Name $diskName

# Застосовуємо зміни
Update-AzVM -ResourceGroupName $resourceGroupName -VM $vm

# Шукаємо від'єднані диски
$unattachedDisks = Get-AzDisk -ResourceGroupName $resourceGroupName |
    Where-Object { $_.DiskState -eq "Unattached" }

# Зберігаємо результат
$unattachedDisks | ConvertTo-Json -Depth 10 |
    Out-File -FilePath "$PWD/result.json" -Encoding utf8