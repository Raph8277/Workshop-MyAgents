param(
    [string]$DatabasePath = "library.db"
)

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

dotnet run --project (Join-Path $root "..\..\tools\library-db-builder") -- migrate $root $DatabasePath

if ($LASTEXITCODE -ne 0) {
    throw "Migration failed."
}

Write-Output "SQLite migrations applied to $DatabasePath"