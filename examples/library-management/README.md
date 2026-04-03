# Library Management Database

This example provides a complete SQLite workshop artifact set for a library management domain.

## Artifacts
- `schema.sql`: the current target schema.
- `seed.sql`: a small realistic dataset for testing and learning.
- `migrations/001_initial_schema.sql`: the initial migration.
- `migrations/002_add_member_phone.sql`: an additive migration with a simple backfill.
- `migrations/003_add_book_presentation.sql`: adds the book description and cover fields used by the UI.
- `build-library-db.ps1`: creates a database from ordered migrations and seed data.
- `apply-library-migrations.ps1`: reapplies ordered migrations to an existing database.

## Notes
- The final schema includes book `description` and `cover_image_url` so applications can display a summary and a cover for each book.
- Once `sqlite3` is available, the database can be built with:

```bash
sqlite3 library.db < migrations/001_initial_schema.sql
sqlite3 library.db < migrations/002_add_member_phone.sql
sqlite3 library.db < migrations/003_add_book_presentation.sql
sqlite3 library.db < seed.sql
```

- Or with the helper script:

```powershell
./build-library-db.ps1 -DatabasePath library.db
```