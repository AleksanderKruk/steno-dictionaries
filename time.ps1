param (
    [string]$ParameterName
)

$x = [System.DateTime]::UtcNow
Invoke-Expression $ParameterName
$y = [System.DateTime]::UtcNow
Write-Host $($y - $x)