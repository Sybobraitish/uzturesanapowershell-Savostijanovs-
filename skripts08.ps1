# Atskaites ID: RVT-4417

$Laiks1 = Measure-Command {
    $Serviss1 = Get-Service -Name Spooler
}

$Laiks2 = Measure-Command {
    $Serviss2 = Get-CimInstance -ClassName Win32_Service -Filter "Name = 'Spooler'"
}

Write-Output "Pirmais veids: Get-Service"
Write-Output "Servisa nosaukums: $($Serviss1.Name)"
Write-Output "Servisa statuss: $($Serviss1.Status)"
Write-Output "Izpildes laiks: $($Laiks1.TotalMilliseconds) ms"

Write-Output ""

Write-Output "Otrais veids: Get-CimInstance"
Write-Output "Servisa nosaukums: $($Serviss2.Name)"
Write-Output "Servisa statuss: $($Serviss2.State)"
Write-Output "Izpildes laiks: $($Laiks2.TotalMilliseconds) ms"