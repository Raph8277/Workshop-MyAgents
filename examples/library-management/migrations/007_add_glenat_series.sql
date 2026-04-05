BEGIN TRANSACTION;

INSERT OR IGNORE INTO series (id, code, title) VALUES
    (2, 'ELRIC', 'Elric'),
    (3, 'HAWKMOON', 'Hawkmoon');

INSERT OR IGNORE INTO contributor (id, display_name) VALUES
    (4, 'Julien Blondel'),
    (5, 'Robin Recht'),
    (6, 'Didier Poli'),
    (7, 'Jean Bastide'),
    (8, 'Michael Moorcock'),
    (9, 'Jean-Luc Cano'),
    (10, 'Julien Telo'),
    (11, 'Valentin Sécher'),
    (12, 'Jérôme Le Gris'),
    (13, 'Benoît Dellac'),
    (14, 'Luca Bulgheroni');

INSERT OR IGNORE INTO album (
    id,
    series_id,
    volume_number,
    title,
    dargaud_publication_date,
    scenario,
    drawing,
    isbn_ean,
    release_year,
    summary,
    dargaud_url,
    cover_image_url,
    summary_source_url
) VALUES
    (25, 2, 1, 'Le trône de rubis', '22.05.2013', 'Julien Blondel', 'Robin Recht, Didier Poli, Jean Bastide', '9782723487047', 2013, 'Albinos fragile et empereur de Melniboné, Elric voit son cousin Yyrkoon contester sa légitimité au trône de rubis.', 'https://www.glenat.com/glenat-bd/elric-tome-01-9782723487047/', 'https://media.hachette.fr/imgArticle/GLENAT/2013/9782723487047-X.jpg?source=web&v=5bd1308fee7f968b25d03f3b913ab527', 'https://www.glenat.com/glenat-bd/elric-tome-01-9782723487047/'),
    (26, 2, 2, 'Stormbringer', '24.09.2014', 'Julien Blondel, Jean-Luc Cano', 'Robin Recht, Didier Poli, Julien Telo', '9782723487054', 2014, 'Yyrkoon a enlevé Cymoril. Elric traverse les Jeunes Royaumes pour sauver sa promise et affronter son cousin.', 'https://www.glenat.com/glenat-bd/elric-tome-02-9782723487054/', 'https://media.hachette.fr/imgArticle/GLENAT/2014/9782723487054-X.jpg?source=web&v=b8403bc1fda79a6ef8eca57dd7bce17a', 'https://www.glenat.com/glenat-bd/elric-tome-02-9782723487054/'),
    (27, 2, 3, 'Le Loup blanc', '20.09.2017', 'Julien Blondel, Jean-Luc Cano', 'Robin Recht, Julien Telo', '9782723487061', 2017, 'Exilé d''Imrryr, Elric erre dans les Jeunes Royaumes et vend ses talents de guerrier et de sorcier sous le regard d''Arioch.', 'https://www.glenat.com/glenat-bd/elric-tome-03-9782723487061/', 'https://media.hachette.fr/imgArticle/GLENAT/2018/9782723487061-001-X.jpeg?source=web&v=9ffb23b447afd654f1013423408e2f7d', 'https://www.glenat.com/glenat-bd/elric-tome-03-9782723487061/'),
    (28, 2, 4, 'La cité qui rêve', '28.04.2021', 'Julien Blondel, Jean-Luc Cano', 'Julien Telo', '9782723487078', 2021, 'Troublé par une révélation sur ses ancêtres, Elric part vers la cité originelle de Melniboné et embrasse davantage son destin.', 'https://www.glenat.com/glenat-bd/elric-tome-04-9782723487078/', 'https://media.hachette.fr/imgArticle/GLENAT/2021/9782723487078-001-X.jpeg?source=web&v=a745dd01e8ab2061b4746196415f7d57', 'https://www.glenat.com/glenat-bd/elric-tome-04-9782723487078/'),
    (29, 2, 5, 'Le Nécromancien', '03.04.2024', 'Julien Blondel, Jean-Luc Cano', 'Valentin Sécher', '9782344057230', 2024, 'Mercenaire depuis la chute d''Imrryr, Elric reprend la mer vers Dhakos après sa rencontre avec Tristelune et l''appel d''une mystérieuse alliée.', 'https://www.glenat.com/glenat-bd/elric-tome-05-9782344057230/', 'https://media.hachette.fr/imgArticle/GLENAT/2024/9782344057230-001-X.jpeg?source=web&v=81210fd2cba7ddd54da2782afdfa36b0', 'https://www.glenat.com/glenat-bd/elric-tome-05-9782344057230/'),
    (30, 2, 6, 'La Sorcière dormante', '15.10.2025', 'Julien Blondel, Jean-Luc Cano', 'Valentin Sécher', '9782344067024', 2025, 'Toujours aux côtés de Tristelune, Elric devient la cible du sorcier Theleb K''aarna, avide de l''Actorios et de la chute du prince albinos.', 'https://www.glenat.com/glenat-bd/elric-tome-06-9782344067024/', 'https://media.hachette.fr/imgArticle/GLENAT/2025/9782344067024-001-X.jpeg?source=web&v=24947ae1419c63ea168bf411ec5f39bd', 'https://www.glenat.com/glenat-bd/elric-tome-06-9782344067024/'),
    (31, 3, 1, 'Le Joyau noir', '07.09.2022', 'Jérôme Le Gris', 'Benoît Dellac, Didier Poli', '9782344027899', 2022, 'Dans une Europe dévastée, le Ténébreux Empire étend sa domination et le duc Dorian Hawkmoon devient l''un des derniers espoirs du continent.', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-01-9782344027899/', 'https://media.hachette.fr/imgArticle/GLENAT/2022/9782344027899-001-X.jpeg?source=web&v=d1d1f9071d339e6ee9f1e8eee9b0ecf0', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-01-9782344027899/'),
    (32, 3, 2, 'La bataille de Kamarg', '17.05.2023', 'Jérôme Le Gris', 'Benoît Dellac', '9782344027905', 2023, 'Le joyau noir asservit Hawkmoon, envoyé espionner la Kamarg alors que le baron Meliadus prépare la chute d''un des derniers royaumes libres.', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-02-9782344027905/', 'https://media.hachette.fr/imgArticle/GLENAT/2023/9782344027905-001-X.jpeg?source=web&v=8424b2475344f49ee7875be2814b925f', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-02-9782344027905/'),
    (33, 3, 3, 'Le dieu fou', '15.05.2024', 'Jérôme Le Gris', 'Benoît Dellac, Luca Bulgheroni', '9782344027912', 2024, 'Après la bataille de Kamarg, Hawkmoon cherche de nouveaux alliés tandis que les forces granbretonnes poursuivent leur conquête du continent.', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-03-9782344027912/', 'https://media.hachette.fr/imgArticle/GLENAT/2024/9782344027912-001-X.jpeg?source=web&v=fffa9af872db1728c28df06c6f5d587d', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-03-9782344027912/'),
    (34, 3, 4, 'L''Héliogone', '30.04.2025', 'Jérôme Le Gris', 'Benoît Dellac, Luca Bulgheroni', '9782344027929', 2025, 'Prisonnier des Granbretons, Hawkmoon lutte contre le pouvoir du joyau noir pendant que la quête de l''Héliogone peut encore changer la guerre.', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-04-9782344027929/', 'https://media.hachette.fr/imgArticle/GLENAT/2025/9782344027929-001-X.jpeg?source=web&v=dd077c9c1eedf591b557cf920c180db9', 'https://www.glenat.com/glenat-bd/hawkmoon-tome-04-9782344027929/');

INSERT OR IGNORE INTO album_contributor (album_id, contributor_id, contribution_type) VALUES
    (25, 5, 'dessin'),
    (25, 6, 'dessin'),
    (25, 7, 'dessin'),
    (26, 5, 'dessin'),
    (26, 6, 'dessin'),
    (26, 10, 'dessin'),
    (27, 5, 'dessin'),
    (27, 10, 'dessin'),
    (28, 10, 'dessin'),
    (29, 11, 'dessin'),
    (30, 11, 'dessin'),
    (31, 13, 'dessin'),
    (31, 6, 'dessin'),
    (32, 13, 'dessin'),
    (33, 13, 'dessin'),
    (33, 14, 'dessin'),
    (34, 13, 'dessin'),
    (34, 14, 'dessin');

COMMIT;