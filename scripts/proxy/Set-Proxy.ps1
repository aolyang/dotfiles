param(
    [string]$P = "http",
    [string]$H = "127.0.0.1",
    [string]$Port = "7890",
    [Switch]$C = $false
)
<#
    .Example
        PS> Set-Proxy.ps1 -P http -H 127.0.0.1 -Port 7890
    .Example
        PS> Set-Proxy.ps1 -Default
    .Example
        PS> Set-Proxy.ps1 -Clear
#>

if ($C)
{
    $Env:HTTP_PROXY = ""
    $Env:HTTPS_PROXY = ""
    Write-Host "clear proxy"
    return
}

$Proxy = $P + "://" + $H + ":" + "$Port"
$Env:HTTP_PROXY = $Proxy
$Env:HTTPS_PROXY = $Proxy

Write-Host "set proxy to $Proxy"
