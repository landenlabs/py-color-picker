<#
.SYNOPSIS
    Regenerate icon.icns and icon.ico from icon.png.

.DESCRIPTION
    Run this on Windows whenever icon.png is updated, then commit all three
    files together. Delegates to make_icons.py (Pillow), so the output is
    identical to running make-icons.bash on macOS/Linux.

.EXAMPLE
    .\make-icons.ps1

.EXAMPLE
    .\make-icons.ps1 path\to\icon.png
#>

$ErrorActionPreference = 'Stop'

$Root = (git rev-parse --show-toplevel 2>$null)
if (-not $Root) { Write-Error "Not inside a git repository."; exit 1 }
Set-Location $Root

$Py = Get-Command python -ErrorAction SilentlyContinue
if (-not $Py) { $Py = Get-Command python3 -ErrorAction SilentlyContinue }
if (-not $Py) { Write-Error "python not found on PATH."; exit 1 }

& $Py.Source -c "import PIL" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Pillow not found - installing (pip install --user Pillow)..."
    & $Py.Source -m pip install --quiet --user Pillow
}

& $Py.Source (Join-Path $Root "make_icons.py") @args
exit $LASTEXITCODE
