$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
        throw 'Install Node.js 24 LTS, reopen PowerShell, then run this script again.'
    }
    if (-not (Test-Path -LiteralPath 'node_modules')) {
        npm ci
        if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' }
    }
    npm run dev
    if ($LASTEXITCODE -ne 0) { throw 'The development server exited with an error.' }
} finally {
    Pop-Location
}
