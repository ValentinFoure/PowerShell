$devicesInfo = @{}

# Liste des imprimantes installées
$printers = Get-WmiObject Win32_Printer
$devicesInfo["Imprimantes installées"] = $printers.Name

# Liste des périphériques USB connectés
$usbDevices = Get-WmiObject Win32_USBHub
$devicesInfo["Périphériques USB"] = $usbDevices.DeviceID

$devicesInfo