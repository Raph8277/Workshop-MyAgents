BEGIN TRANSACTION;

CREATE UNIQUE INDEX IF NOT EXISTS ux_album_isbn_ean ON album(isbn_ean);
CREATE UNIQUE INDEX IF NOT EXISTS ux_album_dargaud_url ON album(dargaud_url);
CREATE INDEX IF NOT EXISTS idx_album_isbn_ean ON album(isbn_ean);

COMMIT;