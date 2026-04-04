# Library Management Database

This example provides a complete SQLite workshop artifact set for a comics catalog focused on Les Chroniques de la Lune Noire.

## Artifacts
- `schema.sql`: the current target schema.
- `seed.sql`: the catalog dataset.
- `migrations/001_initial_schema.sql`: the current catalog schema migration.
- `migrations/002_add_member_phone.sql`: reserved migration slot kept for workshop continuity.
- `migrations/003_add_book_presentation.sql`: reserved migration slot kept for workshop continuity.
- `migrations/004_adapt_to_comics_catalog.sql`: explicit rebuild migration from the old lending model to the comics catalog model.
- `build-library-db.ps1`: creates a database from ordered migrations and seed data.
- `apply-library-migrations.ps1`: reapplies ordered migrations to an existing database.

## Notes
- The final schema is organized around `series`, `album`, `contributor`, and `album_contributor`.
- Each album keeps the volume number from the provided dataset, its release year, summary, and cover image URL.
- Once `sqlite3` is available, the database can be built with:

```bash
sqlite3 library.db < migrations/001_initial_schema.sql
sqlite3 library.db < migrations/002_add_member_phone.sql
sqlite3 library.db < migrations/003_add_book_presentation.sql
sqlite3 library.db < migrations/004_adapt_to_comics_catalog.sql
sqlite3 library.db < seed.sql
```

- Or with the helper script:

```powershell
./build-library-db.ps1 -DatabasePath library.db
```