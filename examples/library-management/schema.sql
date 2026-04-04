PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS series (
    id INTEGER PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS contributor (
    id INTEGER PRIMARY KEY,
    display_name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS album (
    id INTEGER PRIMARY KEY,
    series_id INTEGER NOT NULL,
    volume_number INTEGER NOT NULL,
    title TEXT NOT NULL,
    release_year INTEGER NOT NULL,
    summary TEXT NOT NULL,
    cover_image_url TEXT NOT NULL UNIQUE,
    UNIQUE (series_id, volume_number),
    FOREIGN KEY (series_id) REFERENCES series(id)
);

CREATE TABLE IF NOT EXISTS album_contributor (
    album_id INTEGER NOT NULL,
    contributor_id INTEGER NOT NULL,
    contribution_type TEXT NOT NULL,
    PRIMARY KEY (album_id, contributor_id, contribution_type),
    FOREIGN KEY (album_id) REFERENCES album(id),
    FOREIGN KEY (contributor_id) REFERENCES contributor(id)
);

CREATE INDEX IF NOT EXISTS idx_album_series_id ON album(series_id);
CREATE INDEX IF NOT EXISTS idx_album_release_year ON album(release_year);
CREATE INDEX IF NOT EXISTS idx_album_contributor_contributor_id ON album_contributor(contributor_id);