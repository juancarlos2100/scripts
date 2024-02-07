#Memory (RAM) - 2 GB
#Hard Disk Space - 80 GB
#OS Installation Source - Image File (.iso)
#NetworkAdapter - Internal Switch (prive)

#Virtual Machines Details
#Virtual Machine Name - 'test1'
#Virtual Machine Generation - 2 (UEFI)
#Memory (RAM) - 4 GB
#Hard Disk Space - 80 GB
#OS Installation Source - Image File (.iso)
#NetworkAdapter - Internal Switch (intern)

#Step - 1 Create Virtual Machine (VM Name, Memory, Generation, Hard disk)
New-VM -Name "test" -Path "C:\Hyper-V" -Generation 2 -MemoryStartupBytes 4GB -NewVHDPath "C:\Hyper-V\test.vhdx" -NewVHDSizeBytes 60GB
New-VM -Name "test1" -Path "C:\Hyper-V" -Generation 2 -MemoryStartupBytes 4GB -NewVHDPath "C:\Hyper-V\test1.vhdx" -NewVHDSizeBytes 60GB

#Step - 2 Configuring Memory Usage Options
#Disable Dynamic Memory usage
Set-VMMemory "test" -DynamicMemoryEnabled $false
Set-VMMemory "test1" -DynamicMemoryEnabled $false

#Step - 3 Add DVD Drive and Attach Image File (.iso) to VM
Add-VMDvdDrive -VMName test -Path "C:\Users\Administrador\Downloads\win11.iso"
Add-VMDvdDrive -VMName test1 -Path "C:\Users\Administrador\Downloads\win11.iso"

#Step - 4 Mount Installation Media (Optional)
$DVDDrive = Get-VMDvdDrive -VMName "test"
$DVDDrive = Get-VMDvdDrive -VMName "test1"

#Step - 5 Set Network Adapter
Get-VMSwitch puente | Connect-VMNetworkAdapter -VMName test
Get-VMSwitch puente | Connect-VMNetworkAdapter -VMName test1

#Step - 6 Set Boot Priority
$DVDDrive = "C:\Users\Administrador\Downloads\win11.iso"
Set-VMFirmware "test" -FirstBootDevice $DVDDrive
Set-VMFirmware "test1" -FirstBootDevice $DVDDrive

#Step - 7 View Created Virtual Machine
Get-VM

#Step - 8 Start / Stop and connect to virtual machine (Manage VM)
Start-VM -Name "test"
Start-VM -Name "test1"

#Time to Test VM
VMConnect.exe PLW-PBL-SP test
VMConnect.exe PLW-PBL-SP test1

#Hold screen
Read-Host -Prompt "Press Enter to exit"

#Starts all of the VMs and installation of OS will be started.
Start-VM -Name "test"
Start-VM -Name "test1"
