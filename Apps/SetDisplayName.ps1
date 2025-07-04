# SetDisplayName.ps1
# Setzt DisplayName für Hi-Fi Cable Input / VB-Audio Hi-Fi Cable auf "Better Warzone Tune"

$renderKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render'
$subKeys = Get-ChildItem $renderKey
foreach ($subKey in $subKeys) {
    $propPath = Join-Path $subKey.PSPath 'Properties'
    if (Test-Path $propPath) {
        $props = Get-ItemProperty $propPath
        foreach ($name in $props.PSObject.Properties.Name) {
            $value = $props.$name
            if ($value -eq 'Hi-Fi Cable Input' -or $value -eq 'VB-Audio Hi-Fi Cable') {
                Set-ItemProperty -Path $propPath -Name $name -Value 'Better Warzone Tune'
            }
        }
    }
}
