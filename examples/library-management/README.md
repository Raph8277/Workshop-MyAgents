# Library Management Database

This example provides a complete SQLite artifact set for a comics catalog centered on the BlackMoon domain.

## Scope
The database stores comic series, albums, credited contributors, and the ownership status of each album. The runtime database is used by the BlackMoon application stack to browse the catalog and persist whether an album is already owned.

## Artifacts
- `schema.sql`: current relational schema snapshot for `series`, `album`, `contributor`, and `album_contributor`.
- `seed.sql`: initial Les Chroniques de la Lune Noire dataset.
- `migrations/001_initial_schema.sql`: creates the initial catalog schema.
- `migrations/002_add_member_phone.sql`: reserved migration slot kept for workshop continuity.
- `migrations/003_add_book_presentation.sql`: reserved migration slot kept for workshop continuity.
- `migrations/004_adapt_to_comics_catalog.sql`: rebuilds the old lending schema into the comics catalog schema.
- `migrations/005_expand_album_metadata.sql`: adds publisher metadata, URLs, and summary source fields to `album`.
- `migrations/006_enforce_album_metadata_uniqueness.sql`: adds uniqueness rules for `isbn_ean` and `dargaud_url`.
- `migrations/007_add_glenat_series.sql`: adds Elric and Hawkmoon data, plus their contributors.
- `migrations/008_add_album_owned_flag.sql`: adds `album.is_owned` as a persisted ownership flag with default `0`.
- `build-library-db.ps1`: builds a database from ordered migrations and seed data.
- `apply-library-migrations.ps1`: reapplies ordered migrations to an existing database.

## Data model
The final runtime model is organized around:
- `series`: one row per comics series.
- `album`: one row per volume, including editorial metadata, cover URL, publisher page URL, and `is_owned`.
- `contributor`: one row per credited person.
- `album_contributor`: many-to-many bridge between albums and contributors.

Key rules:
- `series.code` and `series.title` are unique.
- `album.isbn_ean` is unique.
- `album.dargaud_url` is unique.
- `album.cover_image_url` is unique.
- each album is unique within its series by `series_id` plus `volume_number`.
- `album.is_owned` persists the owned or missing state used by the UI and gRPC APIs.

## Ordered build procedure
Apply the SQL artifacts in this order:
1. `migrations/001_initial_schema.sql`
2. `migrations/002_add_member_phone.sql`
3. `migrations/003_add_book_presentation.sql`
4. `migrations/004_adapt_to_comics_catalog.sql`
5. `migrations/005_expand_album_metadata.sql`
6. `migrations/006_enforce_album_metadata_uniqueness.sql`
7. `migrations/007_add_glenat_series.sql`
8. `migrations/008_add_album_owned_flag.sql`
9. `seed.sql`

Recommended PowerShell build:

```powershell
./build-library-db.ps1 -DatabasePath library.db
```

Apply migrations to an existing database:

```powershell
./apply-library-migrations.ps1 -DatabasePath library.db
```

If `sqlite3` is available and you want to run the SQL files manually:

```bash
sqlite3 library.db < migrations/001_initial_schema.sql
sqlite3 library.db < migrations/002_add_member_phone.sql
sqlite3 library.db < migrations/003_add_book_presentation.sql
sqlite3 library.db < migrations/004_adapt_to_comics_catalog.sql
sqlite3 library.db < migrations/005_expand_album_metadata.sql
sqlite3 library.db < migrations/006_enforce_album_metadata_uniqueness.sql
sqlite3 library.db < migrations/007_add_glenat_series.sql
sqlite3 library.db < migrations/008_add_album_owned_flag.sql
sqlite3 library.db < seed.sql
```

## Usage notes
- The ordered migrations are the authoritative evolution path for the runtime database.
- The seed file initializes the core Les Chroniques de la Lune Noire catalog.
- Migration `007` expands the catalog with additional fantasy comics series.
- Migration `008` is required if you want the application to persist album ownership and expose it through `SetAlbumOwned`.