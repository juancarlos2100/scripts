# Define el nombre de la VM y la ruta a la imagen
$vmName = "mi-vm"
$imagePath = "E:\\Catalogo\\install.wim"

# Crea una nueva VM con los ajustes mínimos de Windows 10 Home
New-VM -Name $vmName -MemoryStartupBytes 2GB -Generation 2 -NewVHDPath $imagePath -NewVHDSizeBytes 50GB

# Configura la VM con 1 CPU
Set-VMProcessor -VMName $vmName -Count 2

# Inicia la VM
Start-VM -Name $vmName

# Abre la consola de Hyper-V
vmconnect localhost $vmName
