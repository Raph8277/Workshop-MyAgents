BEGIN TRANSACTION;

INSERT INTO author (id, full_name, birth_year, country_code) VALUES
    (1, 'George Orwell', 1903, 'GB'),
    (2, 'Mary Shelley', 1797, 'GB'),
    (3, 'Antoine de Saint-Exupery', 1900, 'FR');

INSERT INTO category (id, code, label) VALUES
    (1, 'NOVEL', 'Novel'),
    (2, 'SCI-FI', 'Science Fiction'),
    (3, 'YOUTH', 'Youth');

INSERT INTO member (id, member_number, full_name, email, joined_on, phone, status) VALUES
    (1, 'MBR-001', 'Alice Martin', 'alice.martin@example.org', '2026-01-15', '+33140000001', 'active'),
    (2, 'MBR-002', 'Bruno Dupont', 'bruno.dupont@example.org', '2026-02-03', '+33140000002', 'active'),
    (3, 'MBR-003', 'Claire Bernard', 'claire.bernard@example.org', '2026-02-21', '+33140000003', 'suspended');

INSERT INTO book (id, isbn, title, description, cover_image_url, publication_year, category_id) VALUES
    (1, '9780451524935', '1984', 'A dystopian novel about surveillance, authoritarianism, and the manipulation of truth.', 'https://images.example.org/books/1984.jpg', 1949, 2),
    (2, '9780141439471', 'Frankenstein', 'A foundational gothic novel exploring creation, responsibility, and isolation.', 'https://images.example.org/books/frankenstein.jpg', 1818, 1),
    (3, '9780156013987', 'Le Petit Prince', 'A poetic tale about childhood, imagination, and what truly matters.', 'https://images.example.org/books/le-petit-prince.jpg', 1943, 3);

INSERT INTO book_author (book_id, author_id, author_role) VALUES
    (1, 1, 'author'),
    (2, 2, 'author'),
    (3, 3, 'author');

INSERT INTO book_copy (id, book_id, inventory_code, acquired_on, copy_status) VALUES
    (1, 1, 'CPY-1984-001', '2025-10-12', 'available'),
    (2, 1, 'CPY-1984-002', '2025-10-12', 'loaned'),
    (3, 2, 'CPY-FRANK-001', '2025-11-03', 'available'),
    (4, 3, 'CPY-PRINCE-001', '2025-12-18', 'maintenance');

INSERT INTO loan (id, copy_id, member_id, loaned_on, due_on, returned_on) VALUES
    (1, 2, 1, '2026-03-28', '2026-04-11', NULL);

INSERT INTO reservation (id, book_id, member_id, reserved_on, reservation_status) VALUES
    (1, 1, 2, '2026-04-01', 'pending'),
    (2, 3, 1, '2026-03-30', 'fulfilled');

COMMIT;