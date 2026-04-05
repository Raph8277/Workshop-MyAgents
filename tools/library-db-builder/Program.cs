using Microsoft.Data.Sqlite;

if (args.Length is not (2 or 3))
{
    Console.Error.WriteLine("Usage:");
    Console.Error.WriteLine("  dotnet run --project tools/library-db-builder -- <library-root> <output-db-path>");
    Console.Error.WriteLine("  dotnet run --project tools/library-db-builder -- build <library-root> <output-db-path>");
    Console.Error.WriteLine("  dotnet run --project tools/library-db-builder -- migrate <library-root> <existing-db-path>");
    return 1;
}

var mode = args.Length == 2 ? "build" : args[0].Trim().ToLowerInvariant();
var libraryRoot = Path.GetFullPath(args.Length == 2 ? args[0] : args[1]);
var outputDbPath = Path.GetFullPath(args.Length == 2 ? args[1] : args[2]);
var migrationsPath = Path.Combine(libraryRoot, "migrations");
var seedPath = Path.Combine(libraryRoot, "seed.sql");

if (mode is not ("build" or "migrate"))
{
    Console.Error.WriteLine($"Unsupported mode: {mode}");
    return 1;
}

if (!Directory.Exists(libraryRoot))
{
    Console.Error.WriteLine($"Library root not found: {libraryRoot}");
    return 1;
}

if (!Directory.Exists(migrationsPath))
{
    Console.Error.WriteLine($"Migrations directory not found: {migrationsPath}");
    return 1;
}

if (!File.Exists(seedPath))
{
    Console.Error.WriteLine($"Seed file not found: {seedPath}");
    return 1;
}

var outputDirectory = Path.GetDirectoryName(outputDbPath);
if (string.IsNullOrEmpty(outputDirectory))
{
    Console.Error.WriteLine("Output directory could not be determined.");
    return 1;
}

Directory.CreateDirectory(outputDirectory);

var connectionString = new SqliteConnectionStringBuilder
{
    DataSource = outputDbPath,
    ForeignKeys = true,
}.ToString();

using var connection = new SqliteConnection(connectionString);
connection.Open();

EnsureMigrationHistoryTable(connection);

if (mode == "build")
{
    ResetDatabase(connection);
}

ApplyMigrations(connection, migrationsPath);

if (mode == "build")
{
    ExecuteScript(connection, seedPath);
    Console.WriteLine($"Created SQLite database at {outputDbPath}");
}
else
{
    Console.WriteLine($"Applied pending migrations to SQLite database at {outputDbPath}");
}

return 0;

static void ApplyMigrations(SqliteConnection connection, string migrationsPath)
{
    foreach (var migrationFile in Directory.GetFiles(migrationsPath, "*.sql").OrderBy(path => path, StringComparer.OrdinalIgnoreCase))
    {
        var migrationName = Path.GetFileName(migrationFile);
        if (HasMigrationBeenApplied(connection, migrationName))
        {
            continue;
        }

        ExecuteScript(connection, migrationFile);
        RecordMigration(connection, migrationName);
        Console.WriteLine($"Applied migration: {migrationName}");
    }
}

static void ExecuteScript(SqliteConnection connection, string scriptPath)
{
    var sql = File.ReadAllText(scriptPath);
    using var command = connection.CreateCommand();
    command.CommandText = sql;
    command.ExecuteNonQuery();
}

static void ResetDatabase(SqliteConnection connection)
{
    const string resetSql = @"
PRAGMA foreign_keys = OFF;
DROP TABLE IF EXISTS __migration_history;
DROP TABLE IF EXISTS album_contributor;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS contributor;
DROP TABLE IF EXISTS series;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS book_copy;
DROP TABLE IF EXISTS book_author;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS author;
PRAGMA foreign_keys = ON;";

    using var command = connection.CreateCommand();
    command.CommandText = resetSql;
    command.ExecuteNonQuery();

    EnsureMigrationHistoryTable(connection);
}

static void EnsureMigrationHistoryTable(SqliteConnection connection)
{
    const string sql = @"
CREATE TABLE IF NOT EXISTS __migration_history (
    migration_name TEXT PRIMARY KEY,
    applied_utc TEXT NOT NULL
);";

    using var command = connection.CreateCommand();
    command.CommandText = sql;
    command.ExecuteNonQuery();
}

static bool HasMigrationBeenApplied(SqliteConnection connection, string migrationName)
{
    using var command = connection.CreateCommand();
    command.CommandText = "SELECT EXISTS(SELECT 1 FROM __migration_history WHERE migration_name = $name);";
    command.Parameters.AddWithValue("$name", migrationName);
    return Convert.ToInt32(command.ExecuteScalar()) == 1;
}

static void RecordMigration(SqliteConnection connection, string migrationName)
{
    using var command = connection.CreateCommand();
    command.CommandText = @"
INSERT INTO __migration_history (migration_name, applied_utc)
VALUES ($name, $appliedUtc);";
    command.Parameters.AddWithValue("$name", migrationName);
    command.Parameters.AddWithValue("$appliedUtc", DateTime.UtcNow.ToString("O"));
    command.ExecuteNonQuery();
}