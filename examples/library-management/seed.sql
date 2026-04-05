BEGIN TRANSACTION;

INSERT INTO series (id, code, title) VALUES
    (1, 'LUNE-NOIRE', 'Les Chroniques de la Lune Noire');

INSERT INTO contributor (id, display_name) VALUES
    (1, 'Fabrice Angleraud'),
    (2, 'Olivier Ledroit'),
    (3, 'Pontet Cyril');

INSERT INTO album (
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
    (1, 1, 0, 'En un jeu cruel', '28.10.2011', 'François Froideval', 'Fabrice Angleraud', '9782205060713', 2011, 'Préquelle : Lucifer et Pazuzu lancent un jeu fatal dont l’enfance de Wismerhill sera l’un des enjeux.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-16', 'https://bdi.dlpdomain.com/album/9782205060713-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-16'),
    (2, 1, 1, 'Le Signe des ténèbres', '25.08.1994', 'François Froideval', 'Olivier Ledroit', '9782205043754', 1994, 'L’Oracle annonce la venue de celui qui bouleversera l’Empire : Wismerhill entre en scène avec ses compagnons.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-12', 'https://bdi.dlpdomain.com/album/9782205043754-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-12'),
    (3, 1, 2, 'Le Vent des Dragons', '25.08.1994', 'François Froideval', 'Olivier Ledroit', '9782205043761', 1994, 'Rescapés de Kendhrir, Wismerhill et ses alliés poursuivent leur route vers l’Oracle au milieu des luttes de pouvoir.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-15', 'https://bdi.dlpdomain.com/album/9782205043761-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-15'),
    (4, 1, 3, 'La Marque des démons', '25.08.1994', 'François Froideval', 'Olivier Ledroit', '9782205043778', 1994, 'À l’Oracle, Wismerhill découvre une part de son destin et affronte une tentation démoniaque qui pourrait le marquer à jamais.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-17', 'https://bdi.dlpdomain.com/album/9782205043778-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-17'),
    (5, 1, 4, 'Quand sifflent les serpents', '25.08.1994', 'François Froideval', 'Olivier Ledroit', '9782205043785', 1994, 'La montée de la Lune Noire précipite les factions de l’Empire vers un affrontement où Wismerhill et sa bande jouent un rôle décisif.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-3', 'https://bdi.dlpdomain.com/album/9782205043785-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-3'),
    (6, 1, 5, 'La Danse écarlate', '27.08.1994', 'François Froideval', 'Olivier Ledroit', '9782205042511', 1994, 'La guerre éclate ouvertement et Wismerhill se rallie au maître de la Lune Noire tandis que les armées convergent vers la bataille.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-7', 'https://bdi.dlpdomain.com/album/9782205042511-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-7'),
    (7, 1, 6, 'La Couronne des ombres', '01.04.1995', 'François Froideval', 'Pontet Cyril', '9782205042900', 1995, 'Alors que l’Empire semble triompher, Wismerhill découvre que les ombres du passé et sa destinée le rattrapent.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-14', 'https://bdi.dlpdomain.com/album/9782205042900-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-14'),
    (8, 1, 7, 'De Vents, de Jade et de Jais', '08.03.1997', 'François Froideval', 'Pontet Cyril', '9782205044447', 1997, 'Devenu l’un des plus puissants seigneurs de l’Empire, Wismerhill avance vers sa rencontre avec l’Empereur sous une menace grandissante.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-10', 'https://bdi.dlpdomain.com/album/9782205044447-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-10'),
    (9, 1, 8, 'Le Glaive de justice', '06.02.1999', 'François Froideval', 'Pontet Cyril', '9782205046243', 1999, 'Wismerhill affronte des morts-vivants, gagne de nouveaux pouvoirs et voit l’Empire se préparer à une guerre ouverte.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-11', 'https://bdi.dlpdomain.com/album/9782205046243-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-11'),
    (10, 1, 9, 'Les Chants de la négation', '20.05.2000', 'François Froideval', 'Pontet Cyril', '9782205048544', 2000, 'Alors qu’un ordre fragile revient, Wismerhill et ses alliés préparent leur vengeance contre l’Empereur et ses partisans.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-2', 'https://bdi.dlpdomain.com/album/9782205048544-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-2'),
    (11, 1, 10, 'L''Aigle foudroyé', '14.09.2002', 'François Froideval', 'Pontet Cyril', '9782205050042', 2002, 'Manipulé par Haazheel Thorn, Wismerhill mène l’assaut infernal contre l’Empereur dans un conflit gigantesque.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-8', 'https://bdi.dlpdomain.com/album/9782205050042-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-8'),
    (12, 1, 11, 'Ave Tenebrae', '04.10.2003', 'François Froideval', 'Pontet Cyril', '9782205053913', 2003, 'Ressuscité, Wismerhill accomplit l’ultime outrage pour la Lune Noire et rebâtit l’Empire à sa manière.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-6', 'https://bdi.dlpdomain.com/album/9782205053913-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-6'),
    (13, 1, 12, 'La Porte des Enfers', '30.06.2005', 'François Froideval', 'Pontet Cyril', '9782205055610', 2005, 'Wismerhill découvre qu’il n’était qu’un pion d’Haazel Thorn tandis que le dernier acte de la saga se met en place.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-9', 'https://bdi.dlpdomain.com/album/9782205055610-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-9'),
    (14, 1, 13, 'La Prophétie', '22.09.2006', 'François Froideval', 'Pontet Cyril', '9782205057751', 2006, 'Wismerhill se rebelle contre Haazel Thorn, les alliances finales se nouent et l’affrontement conclusif commence.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-13', 'https://bdi.dlpdomain.com/album/9782205057751-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-13'),
    (15, 1, 14, 'La Fin des temps', '21.11.2008', 'François Froideval', 'Pontet Cyril', '9782205059601', 2008, 'Face aux dieux et aux démons libérés, Wismerhill doit empêcher l’apocalypse dans la conclusion du premier cycle.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-18', 'https://bdi.dlpdomain.com/album/9782205059601-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-18'),
    (16, 1, 15, 'Terra secunda - Livre 1/2', '07.12.2012', 'François Froideval', 'Fabrice Angleraud', '9782205068306', 2012, 'Après l’anéantissement du passé, les survivants gagnent un monde nouveau à reconstruire, tandis que Wismerhill affronte un destin inédit.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-20', 'https://bdi.dlpdomain.com/album/9782205068306-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-20 | https://www.decitre.fr/livres/chroniques-de-la-lune-noire-tome-15-terra-secunda-9782205068306.html'),
    (17, 1, 16, 'Terra secunda - Livre 2/2', '24.10.2014', 'François Froideval', 'Fabrice Angleraud', '9782205071825', 2014, 'Sur Terra Secunda, Wismerhill découvre les Ophidiens et doit bâtir un empire au cœur d’un monde hostile.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-5', 'https://bdi.dlpdomain.com/album/9782205071825-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-5'),
    (18, 1, 17, 'Guerres Ophidiennes', '27.11.2015', 'François Froideval', 'Fabrice Angleraud', '9782205074338', 2015, 'Les humains de Terra Secunda affrontent les Ophidiens, et Wismerhill s’engage lui-même dans la bataille.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-4', 'https://bdi.dlpdomain.com/album/9782205074338-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-4'),
    (19, 1, 18, 'Le Trône d''Opale', '28.04.2017', 'François Froideval', 'Fabrice Angleraud', '9782205075731', 2017, 'Après sa victoire contre les Ophidiens, Wismerhill gît inanimé pendant que les complots se poursuivent sur Terra Secunda et aux Enfers.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire', 'https://bdi.dlpdomain.com/album/9782205075731-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire'),
    (20, 1, 19, 'Une semaine ordinaire', '26.10.2018', 'François Froideval', 'Fabrice Angleraud', '9782205077995', 2018, 'Entre alliances, armées, démons familiers et éducation d’un enfant-dieu, la vie d’empereur absolu de Wismerhill reste explosive.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-19', 'https://bdi.dlpdomain.com/album/9782205077995-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-19'),
    (21, 1, 20, 'Une porte sur l''Enfer', '22.11.2019', 'François Froideval', 'Fabrice Angleraud', '9782205079470', 2019, 'Des cauchemars annoncent à Wismerhill une menace sans nom, alors que l’avenir de l’humanité vacille.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-0', 'https://bdi.dlpdomain.com/album/9782205079470-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-0'),
    (22, 1, 21, 'Sic Transit Gloria Mundi', '03.12.2021', 'François Froideval', 'Fabrice Angleraud', '9782205085044', 2021, 'Les Enfers déversent leurs hordes sur Terra Secunda, et Wismerhill blessé doit confier le front à son double.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-1', 'https://bdi.dlpdomain.com/album/9782205085044-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-1'),
    (23, 1, 22, 'La Forteresse d''Opale', '22.11.2024', 'François Froideval', 'Fabrice Angleraud', '9782205200911', 2024, 'Wismerhill consolide son pouvoir sur Terra Secunda tandis que les démons et Methraton poursuivent leurs propres desseins.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-21', 'https://bdi.dlpdomain.com/album/9782205200911-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-21'),
    (24, 1, 23, 'Qualis Pater, Talis Filius', '14.11.2025', 'François Froideval', 'Fabrice Angleraud', '9782205204605', 2025, 'Le double de Wismerhill traite avec les démons aux Enfers pendant que l’empereur poursuit sa marche vers une forme de divinité.', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-22', 'https://bdi.dlpdomain.com/album/9782205204605-couv.jpg', 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-22');

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