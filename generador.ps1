# Define la ruta del ejecutable oscdimg
$oscdimgPath = 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe'

# Define la ruta de la carpeta de origen y el archivo de destino
$folderPath = "C:\isow10"
$isoPath = "E:\iso_modificadas"

# Crea el archivo .iso
& $oscdimgPath -n -m -b"C:\isow10\boot\etfsboot.com" $folderPath $isoPath
