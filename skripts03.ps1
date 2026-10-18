# Atskaites ID: RVT-4417

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

$Summa = $Darbojas + $Aptureti

Write-Output "Darbojošos servisu skaits: $Darbojas"
Write-Output "Apturēto servisu skaits: $Aptureti"
Write-Output "Abu grupu kopējais skaits: $Summa"
Write-Output "Visu servisu skaits: $($Servisi.Count)"