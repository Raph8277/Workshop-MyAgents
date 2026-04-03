param(
    [string]$DatabasePath = "library.db"
)

$sqlite = Get-Command sqlite3 -ErrorAction SilentlyContinue
if (-not $sqlite) {
    throw "sqlite3 is required to build the database. Install sqlite3 and rerun this script."
}

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

Get-ChildItem (Join-Path $root "migrations") -Filter "*.sql" |
    Sort-Object Name |
    ForEach-Object {
        Get-Content $_.FullName | & $sqlite.Source $DatabasePath
    }

Get-Content (Join-Path $root "seed.sql") | & $sqlite.Source $DatabasePath

Write-Output "SQLite database built at $DatabasePath"