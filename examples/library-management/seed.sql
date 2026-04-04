BEGIN TRANSACTION;

INSERT INTO series (id, code, title) VALUES
    (1, 'LUNE-NOIRE', 'Les Chroniques de la Lune Noire');

INSERT INTO contributor (id, display_name) VALUES
    (1, 'Angleraud'),
    (2, 'Ledroit'),
    (3, 'Pontet');

INSERT INTO album (id, series_id, volume_number, title, release_year, summary, cover_image_url) VALUES
    (1, 1, 0, 'En un jeu cruel', 2011, 'Origines de Wismerhill et du jeu infernal', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069236_001.jpg'),
    (2, 1, 1, 'Le Signe des ténèbres', 1989, 'Début de l’ascension de Wismerhill', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040709_001.jpg'),
    (3, 1, 2, 'Le Vent des dragons', 1990, 'Formation du groupe et premières batailles', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040716_001.jpg'),
    (4, 1, 3, 'La Marque des démons', 1991, 'Pactes démoniaques et montée en puissance', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040723_001.jpg'),
    (5, 1, 4, 'Quand sifflent les serpents', 1992, 'Trahisons et complots politiques', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040730_001.jpg'),
    (6, 1, 5, 'La Danse écarlate', 1994, 'Guerre et expansion de la Lune Noire', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040747_001.jpg'),
    (7, 1, 6, 'La Couronne des ombres', 1995, 'Consolidation du pouvoir impérial', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040754_001.jpg'),
    (8, 1, 7, 'De vents, de jade et de jais', 1997, 'Voyage et alliances stratégiques', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040761_001.jpg'),
    (9, 1, 8, 'Le Glaive de justice', 1999, 'Guerre totale et justice divine', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040778_001.jpg'),
    (10, 1, 9, 'Les Chants de la négation', 2000, 'Apogée de l’empire de Wismerhill', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040785_001.jpg'),
    (11, 1, 10, 'L’Aigle foudroyé', 2002, 'Effondrement et trahisons', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040792_001.jpg'),
    (12, 1, 11, 'Ave Tenebræ', 2003, 'Victoire sombre et domination', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040808_001.jpg'),
    (13, 1, 12, 'La Porte des Enfers', 2005, 'Ouverture vers les forces infernales', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040815_001.jpg'),
    (14, 1, 13, 'La Prophétie', 2006, 'Destin final annoncé', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040822_001.jpg'),
    (15, 1, 14, 'La Fin des temps', 2008, 'Conclusion du premier cycle', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040839_001.jpg'),
    (16, 1, 15, 'Terra Secunda (1/2)', 2012, 'Nouveau monde, nouveau cycle', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069243_001.jpg'),
    (17, 1, 16, 'Terra Secunda (2/2)', 2014, 'Conquête et installation', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069250_001.jpg'),
    (18, 1, 17, 'Guerres ophidiennes', 2015, 'Conflits majeurs dans Terra Secunda', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069267_001.jpg'),
    (19, 1, 18, 'Le Trône d’Opale', 2017, 'Lutte pour le pouvoir central', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069274_001.jpg'),
    (20, 1, 19, 'Une semaine ordinaire', 2018, 'Intrigues politiques et magie', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205070584_001.jpg'),
    (21, 1, 20, 'Une porte sur l’enfer', 2019, 'Retour des forces infernales', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205070591_001.jpg'),
    (22, 1, 21, 'Sic Transit Gloria Mundi', 2021, 'Déclin des puissances', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205089968_001.jpg'),
    (23, 1, 22, 'La Forteresse d’Opale', 2024, 'Consolidation du pouvoir', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205200000_001.jpg'),
    (24, 1, 23, 'Qualis Pater, Talis Filius', 2025, 'Héritage et succession', 'https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205200001_001.jpg');

INSERT INTO album_contributor (album_id, contributor_id, contribution_type) VALUES
    (1, 1, 'dessin'),
    (2, 2, 'dessin'),
    (3, 2, 'dessin'),
    (4, 2, 'dessin'),
    (5, 2, 'dessin'),
    (6, 2, 'dessin'),
    (7, 3, 'dessin'),
    (8, 3, 'dessin'),
    (9, 3, 'dessin'),
    (10, 3, 'dessin'),
    (11, 3, 'dessin'),
    (12, 3, 'dessin'),
    (13, 3, 'dessin'),
    (14, 3, 'dessin'),
    (15, 3, 'dessin'),
    (16, 1, 'dessin'),
    (17, 1, 'dessin'),
    (18, 1, 'dessin'),
    (19, 1, 'dessin'),
    (20, 1, 'dessin'),
    (21, 1, 'dessin'),
    (22, 1, 'dessin'),
    (23, 1, 'dessin'),
    (24, 1, 'dessin');

COMMIT;