$Process = Get-Process steam
<# The following line will set Steam to only use the first 4 cores of your processor.
To use a different number of cores, or to use cores other than the first 4, 
replace '15' below with the sum total of the decimal values for the cores you want to use.
If you don't know what any of that means, just stick with 15 #>
$Process.ProcessorAffinity = 15

$InstanceIds = (Get-PnpDevice -FriendlyName 'HID-compliant consumer control device' -status "OK").InstanceId

<# The following loop will disable ALL of your HID compliant consumer control devices.
If you wish to only disable some, replace 'InstanceIds.Length' below with the number you want to disable. #>
For ($i = 0; $i -le InstanceIds.Length; $i++){
    Disable-PnpDevice -InstanceId $InstanceIds[$i] -Confirm:$false
}

<# The following line will start the game at the given file path. The below path is the default one for Prototype 2 
on Windows machines. If your .exe is at a different file path, replace the one below with your own. #>

Start-Process -FilePath 'C:\Program Files (x86)\Steam\steamapps\common\Prototype 2\prototype2.exe'

