$Process = Get-Process steam
<# Set the value below as dictated by the number of cores your processor has.
4 cores: 15
6 cores: 64
8 cores: 255
10 cores: 1023
12 cores: 4095
14 cores: 16383
16 cores: 65535 #>
$Process.ProcessorAffinity = 65535

$InstanceIds = (Get-PnpDevice -FriendlyName 'HID-compliant consumer control device' -status "error").InstanceId

For ($i = 0; $i -le InstanceIds.Length; $i++){
    Enable-PnpDevice -InstanceId $InstanceIds[$i] -Confirm:$false
}
    

