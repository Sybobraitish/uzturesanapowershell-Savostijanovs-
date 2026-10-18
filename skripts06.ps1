# Atskaites ID: RVT-4417

$Draiveri = Get-CimInstance -ClassName Win32_PnPSignedDriver |
    Where-Object {
        $_.DriverProviderName -and
        $_.DriverProviderName -ne "Microsoft"
    }

$Draiveri |
    Select-Object DeviceName, DriverProviderName, DriverVersion, InfName |
    Export-Csv -Path draiveri.csv -NoTypeInformation -Encoding UTF8

Write-Output "Draiveru skaits CSV failā: $($Draiveri.Count)"
Write-Output "CSV fails saglabāts: draiveri.csv"