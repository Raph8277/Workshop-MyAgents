param(
    [string]$DatabasePath = "library.db"
)

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

dotnet run --project (Join-Path $root "..\..\tools\library-db-builder") -- build $root $DatabasePath

if ($LASTEXITCODE -ne 0) {
    throw "Database build failed."
}

Write-Output "SQLite database built at $DatabasePath"