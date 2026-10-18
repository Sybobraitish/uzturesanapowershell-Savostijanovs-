# Atskaites ID: RVT-4417

$Sakums = (Get-Date).AddHours(-48)

$Kludas = Get-WinEvent -FilterHashtable @{
    LogName = "System"
    Level = 2
    StartTime = $Sakums
} -ErrorAction SilentlyContinue

Write-Output "Kļūdu ierakstu skaits pēdējās 48 stundās: $($Kludas.Count)"

if ($Kludas.Count -gt 0) {
    $Avots = $Kludas |
        Group-Object -Property ProviderName |
        Sort-Object -Property Count -Descending |
        Select-Object -First 1

    Write-Output "Biežākais kļūdu avots: $($Avots.Name)"
    Write-Output "Šī avota kļūdu skaits: $($Avots.Count)"
}
else {
    Write-Output "Kļūdu avots: nav kļūdu ierakstu"
    Write-Output "Šī avota kļūdu skaits: 0"
}