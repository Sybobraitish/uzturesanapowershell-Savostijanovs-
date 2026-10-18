# Atskaites ID: RVT-4417

$Adapteri = Get-NetAdapter |
    Select-Object Name, Status, MacAddress, LinkSpeed

$Adapteri | Format-Table -AutoSize

$Adapteri |
    Export-Csv -Path adapteri.csv -NoTypeInformation -Encoding UTF8

Write-Output "Tīkla adapteru skaits: $($Adapteri.Count)"
Write-Output "Informācija saglabāta failā adapteri.csv"