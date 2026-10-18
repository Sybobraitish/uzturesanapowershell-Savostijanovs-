$Procesi = Get-Process |
    Sort-Object -Property WorkingSet64 |
    Select-Object -Last 10

foreach ($Process in $Procesi) {
    $AtminaMB = $Process.WorkingSet64 / 1MB

    Write-Output ("Nosaukums: {0}; ID: {1}; Atmiņa: {2:N1} MB" -f $Process.ProcessName, $Process.Id, $AtminaMB)
}