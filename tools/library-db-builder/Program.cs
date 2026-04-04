using Microsoft.Data.Sqlite;

if (args.Length != 2)
{
    Console.Error.WriteLine("Usage: dotnet run --project tools/library-db-builder -- <library-root> <output-db-path>");
    return 1;
}

var libraryRoot = Path.GetFullPath(args[0]);
var outputDbPath = Path.GetFullPath(args[1]);
var migrationsPath = Path.Combine(libraryRoot, "migrations");
var seedPath = Path.Combine(libraryRoot, "seed.sql");

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

ResetDatabase(connection);

foreach (var migrationFile in Directory.GetFiles(migrationsPath, "*.sql").OrderBy(path => path, StringComparer.OrdinalIgnoreCase))
{
    ExecuteScript(connection, migrationFile);
}

ExecuteScript(connection, seedPath);

Console.WriteLine($"Created SQLite database at {outputDbPath}");
return 0;

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
}