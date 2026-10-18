# Atskaites ID: RVT-4417

$Servisi = Get-CimInstance -ClassName Win32_Service |
    Where-Object {
        $_.StartMode -eq "Auto" -and $_.State -eq "Stopped"
    }

if ($Servisi.Count -eq 0) {
    Write-Output "Apturētu automātisko servisu skaits: 0"
}
else {
    Write-Output "Apturētu automātisko servisu skaits: $($Servisi.Count)"

    foreach ($Serviss in $Servisi) {
        Start-Service -Name $Serviss.Name -WhatIf
    }

    foreach ($Serviss in $Servisi) {
        Start-Service -Name $Serviss.Name
    }
}