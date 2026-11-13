param(
    [Parameter(Mandatory = $true)][string]$AppDir
)

$ErrorActionPreference = 'Stop'

$packageName = 'HyperionOptimizer.Hyperion'
$msix = Join-Path $AppDir 'HyperionOptimizer.msix'
$cer = Join-Path $AppDir 'HyperionOptimizer.cer'
$runtime = Join-Path $AppDir 'Dependencies\Microsoft.WindowsAppRuntime.2.msix'

if (-not (Test-Path -LiteralPath $msix)) {
    throw "Installer payload is missing: $msix"
}

Get-Process -Name 'Hyperion' -ErrorAction SilentlyContinue |
    Stop-Process -Force -ErrorAction SilentlyContinue

# Every build is signed with a new self-signed certificate, so replace an older install
# instead of trying to upgrade it in place.
Get-AppxPackage -Name $packageName -ErrorAction SilentlyContinue |
    Remove-AppxPackage -ErrorAction SilentlyContinue

Import-Certificate -FilePath $cer -CertStoreLocation 'Cert:\LocalMachine\TrustedPeople' | Out-Null

# The app package declares a dependency on the Windows App Runtime, so make sure a new
# enough framework package exists before registering the app.
$runtimeReady = Get-AppxPackage -PackageTypeFilter Framework -Name 'Microsoft.WindowsAppRuntime.2' -ErrorAction SilentlyContinue |
    Where-Object { $_.Version -ge [Version]'2.5.1.0' } |
    Select-Object -First 1

if (-not $runtimeReady) {
    if (-not (Test-Path -LiteralPath $runtime)) {
        throw "Installer payload is missing: $runtime"
    }
    Add-AppxPackage -Path $runtime
}

Add-AppxPackage -Path $msix

# Start the app so the first run is one click, not two.
$installed = Get-AppxPackage -Name $packageName | Select-Object -First 1
if ($installed) {
    Start-Process 'explorer.exe' "shell:AppsFolder\$($installed.PackageFamilyName)!App"
}
