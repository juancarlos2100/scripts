#Memory (RAM) - 2 GB
#Hard Disk Space - 80 GB
#OS Installation Source - Image File (.iso)
#NetworkAdapter - Internal Switch (prive)

#Virtual Machines Details
#Virtual Machine Name - 'vm5'
#Virtual Machine Generation - 2 (UEFI)
#Memory (RAM) - 4 GB
#Hard Disk Space - 80 GB
#OS Installation Source - Image File (.iso)
#NetworkAdapter - Internal Switch (intern)

#Step - 1 Create Virtual Machine (VM Name, Memory, Generation, Hard disk)
New-VM -Name "vm5" -Path "C:\Hyper-V" -Generation 2 -MemoryStartupBytes 4GB -NewVHDPath "C:\Hyper-V\vm5.vhdx" -NewVHDSizeBytes 60GB

#Step - 2 Configuring Memory Usage Options
#Disable Dynamic Memory usage
Set-VMMemory "vm5" -DynamicMemoryEnabled $false

#Step - 3 Add DVD Drive and Attach Image File (.iso) to VM
Add-VMDvdDrive -VMName vm5 -Path "C:\Users\Administrador\Downloads\win11.iso"

#Step - 4 Mount Installation Media (Optional)
$DVDDrive = Get-VMDvdDrive -VMName "vm5"

#Step - 5 Set Network Adapter
Get-VMSwitch puente | Connect-VMNetworkAdapter -VMName vm5

#Step - 6 Set Boot Priority
$DVDDrive = "C:\Users\Administrador\Downloads\win11.iso"
Set-VMFirmware "vm5" -FirstBootDevice $DVDDrive

#Step - 7 View Created Virtual Machine
Get-VM

#Step - 8 Start / Stop and connect to virtual machine (Manage VM)
Start-VM -Name "vm5"

#Time to Test VM
VMConnect.exe PLW-PBL-SP vm5

#Hold screen
Read-Host -Prompt "Press Enter to exit"

#Starts the VM and installation of OS will be started.
Start-VM -Name "vm5"
