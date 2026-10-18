# Atskaites ID: RVT-4417

$Procesi = Get-CimInstance -ClassName Win32_Process

foreach ($Process in $Procesi) {
    $Rezultats = Invoke-CimMethod -InputObject $Process -MethodName GetOwner -ErrorAction SilentlyContinue

    if ($Rezultats.ReturnValue -eq 0) {
        Write-Output "Process: $($Process.Name); ID: $($Process.ProcessId); Lietotājs: $($Rezultats.Domain)\$($Rezultats.User)"
    }
    else {
        Write-Output "Process: $($Process.Name); ID: $($Process.ProcessId); Lietotāju nevar noteikt"
    }
}