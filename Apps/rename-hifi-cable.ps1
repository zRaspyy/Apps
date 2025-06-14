# Sucht Hi-Fi Cable Input im Render-Bereich und benennt es in Better Warzone Tune um

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\MMDevices\Audio\Render"

$found = $false
Get-ChildItem $regPath | ForEach-Object {
    $props = "$($_.PSPath)\Properties"
    try {
        $name = (Get-ItemProperty -Path $props -ErrorAction Stop)."{a45c254e-df1c-4efd-8020-67d146a850e0},2"
        if ($name -eq "Hi-Fi Cable Input") {
            Set-ItemProperty -Path $props -Name "{a45c254e-df1c-4efd-8020-67d146a850e0},2" -Value "Better Warzone Tune"
            Write-Host "Hi-Fi Cable Input wurde umbenannt."
            $found = $true
        }
    } catch {}
}

if ($found) {
    Restart-Service -Name "Audiosrv" -Force
    Write-Host "Windows Audio Dienst wurde neu gestartet."
} else {
    Write-Host "Kein Hi-Fi Cable Input gefunden."
}
