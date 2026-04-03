PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS author (
    id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    birth_year INTEGER,
    country_code TEXT,
    UNIQUE (full_name, birth_year)
);

CREATE TABLE IF NOT EXISTS category (
    id INTEGER PRIMARY KEY,
    code TEXT NOT NULL UNIQUE,
    label TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS member (
    id INTEGER PRIMARY KEY,
    member_number TEXT NOT NULL UNIQUE,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    joined_on TEXT NOT NULL,
    phone TEXT,
    status TEXT NOT NULL CHECK (status IN ('active', 'suspended', 'closed'))
);

CREATE TABLE IF NOT EXISTS book (
    id INTEGER PRIMARY KEY,
    isbn TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    description TEXT,
    cover_image_url TEXT,
    publication_year INTEGER,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE IF NOT EXISTS book_author (
    book_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    author_role TEXT NOT NULL DEFAULT 'author',
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE IF NOT EXISTS book_copy (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    inventory_code TEXT NOT NULL UNIQUE,
    acquired_on TEXT NOT NULL,
    copy_status TEXT NOT NULL CHECK (copy_status IN ('available', 'loaned', 'maintenance', 'lost')),
    FOREIGN KEY (book_id) REFERENCES book(id)
);

CREATE TABLE IF NOT EXISTS loan (
    id INTEGER PRIMARY KEY,
    copy_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    loaned_on TEXT NOT NULL,
    due_on TEXT NOT NULL,
    returned_on TEXT,
    FOREIGN KEY (copy_id) REFERENCES book_copy(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE IF NOT EXISTS reservation (
    id INTEGER PRIMARY KEY,
    book_id INTEGER NOT NULL,
    member_id INTEGER NOT NULL,
    reserved_on TEXT NOT NULL,
    reservation_status TEXT NOT NULL CHECK (reservation_status IN ('pending', 'fulfilled', 'cancelled', 'expired')),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE INDEX IF NOT EXISTS idx_book_category_id ON book(category_id);
CREATE INDEX IF NOT EXISTS idx_book_copy_book_id ON book_copy(book_id);
CREATE INDEX IF NOT EXISTS idx_loan_copy_id ON loan(copy_id);
CREATE INDEX IF NOT EXISTS idx_loan_member_id ON loan(member_id);
CREATE INDEX IF NOT EXISTS idx_reservation_book_id ON reservation(book_id);
CREATE INDEX IF NOT EXISTS idx_reservation_member_id ON reservation(member_id);