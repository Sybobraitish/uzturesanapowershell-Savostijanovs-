$Dators = Get-CimInstance -ClassName Win32_ComputerSystem
$Sistema = Get-CimInstance -ClassName Win32_OperatingSystem
$Procesi = Get-Process

Write-Output "Datora nosaukums: $($Dators.Name)"
Write-Output "Operētājsistēma: $($Sistema.Caption)"
Write-Output "Operētājsistēmas būvējuma numurs: $($Sistema.BuildNumber)"
Write-Output "PowerShell versija: $($PSVersionTable.PSVersion)"
Write-Output "Pašreizējais datums un laiks: $(Get-Date)"
Write-Output "Darbojošos procesu skaits: $($Procesi.Count)"