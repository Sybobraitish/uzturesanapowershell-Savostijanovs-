# Atskaites ID: RVT-4417

$RobezaGB = 10

$Diski = Get-CimInstance -ClassName Win32_LogicalDisk |
    Where-Object {
        $_.DriveType -eq 3
    }

foreach ($Disks in $Diski) {
    $IzmersGB = [math]::Round($Disks.Size / 1GB, 2)
    $BrivaVietaGB = [math]::Round($Disks.FreeSpace / 1GB, 2)

    Write-Output "Disks: $($Disks.DeviceID)"
    Write-Output "Kopējais izmērs: $IzmersGB GB"
    Write-Output "Brīvā vieta: $BrivaVietaGB GB"

    if ($BrivaVietaGB -lt $RobezaGB) {
        Write-Output "BRĪDINĀJUMS: diskā ir mazāk par $RobezaGB GB brīvas vietas!"
    }
}