BEGIN TRANSACTION;

ALTER TABLE book ADD COLUMN description TEXT;
ALTER TABLE book ADD COLUMN cover_image_url TEXT;

UPDATE book
SET
    description = CASE id
        WHEN 1 THEN 'A dystopian novel about surveillance, authoritarianism, and the manipulation of truth.'
        WHEN 2 THEN 'A foundational gothic novel exploring creation, responsibility, and isolation.'
        WHEN 3 THEN 'A poetic tale about childhood, imagination, and what truly matters.'
        ELSE description
    END,
    cover_image_url = CASE id
        WHEN 1 THEN 'https://images.example.org/books/1984.jpg'
        WHEN 2 THEN 'https://images.example.org/books/frankenstein.jpg'
        WHEN 3 THEN 'https://images.example.org/books/le-petit-prince.jpg'
        ELSE cover_image_url
    END
WHERE description IS NULL OR cover_image_url IS NULL;

COMMIT;