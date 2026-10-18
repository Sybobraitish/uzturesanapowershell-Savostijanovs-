# Atskaites ID: RVT-4417

$Procesi = Get-Process
$Servisi = Get-Service

$Darbojas = 0
$Aptureti = 0

foreach ($Serviss in $Servisi) {
    if ($Serviss.Status -eq "Running") {
        $Darbojas++
    }
    elseif ($Serviss.Status -eq "Stopped") {
        $Aptureti++
    }
}

$Sakums = (Get-Date).AddHours(-48)

$Kludas = Get-WinEvent -FilterHashtable @{
    LogName = "System"
    Level = 2
    StartTime = $Sakums
} -ErrorAction SilentlyContinue

$Diski = Get-CimInstance -ClassName Win32_LogicalDisk |
    Where-Object {
        $_.DriveType -eq 3
    }

Write-Output "Darbojošos procesu skaits: $($Procesi.Count)"
Write-Output "Darbojošos servisu skaits: $Darbojas"
Write-Output "Apturēto servisu skaits: $Aptureti"
Write-Output "Kļūdu skaits pēdējās 48 stundās: $($Kludas.Count)"

foreach ($Disks in $Diski) {
    $BrivaVietaGB = [math]::Round($Disks.FreeSpace / 1GB, 2)

    Write-Output "Disks $($Disks.DeviceID): brīvā vieta $BrivaVietaGB GB"
}