$CSV = Import-Csv "C:\Users\JUANC\Documents\proyecto\Scrips\VMs.csv"
$ISOPath = 'ruta\a\tu\imagen.iso'


ForEach($item in $csv)
{
    $VMName = $($item.VMName)
    $Memory = $($item.Memory)
    $Memory = ($Memory / 1)

    $Disk =‘C:\VMs’ + $VMName + ‘.VHDX’
    New-VM -Name $VMName -MemoryStartupBytes $Memory -BootDevice VHD -Path ‘C:\VMs’ -NewVHDPath $Disk -NewVHDSize 30GB -Generation 2 -Switch ‘puente’
    Add-VMDvdDrive -VMName $VMName -Path $ISOPath
    # Asigna recursos del procesador a la VM
    Set-VMProcessor -VMName $VMName -Count 2

    Write-Host $VMName
    Write-Host $Memory
}



