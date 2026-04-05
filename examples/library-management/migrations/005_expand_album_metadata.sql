BEGIN TRANSACTION;

ALTER TABLE album ADD COLUMN dargaud_publication_date TEXT NOT NULL DEFAULT '';
ALTER TABLE album ADD COLUMN scenario TEXT NOT NULL DEFAULT '';
ALTER TABLE album ADD COLUMN drawing TEXT NOT NULL DEFAULT '';
ALTER TABLE album ADD COLUMN isbn_ean TEXT NOT NULL DEFAULT '';
ALTER TABLE album ADD COLUMN dargaud_url TEXT NOT NULL DEFAULT '';
ALTER TABLE album ADD COLUMN summary_source_url TEXT NOT NULL DEFAULT '';

UPDATE contributor SET display_name = 'Fabrice Angleraud' WHERE id = 1;
UPDATE contributor SET display_name = 'Olivier Ledroit' WHERE id = 2;
UPDATE contributor SET display_name = 'Pontet Cyril' WHERE id = 3;

UPDATE album
SET title = 'En un jeu cruel',
    dargaud_publication_date = '28.10.2011',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205060713',
    release_year = 2011,
    summary = 'Préquelle : Lucifer et Pazuzu lancent un jeu fatal dont l’enfance de Wismerhill sera l’un des enjeux.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-16',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205060713-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-16'
WHERE id = 1;

UPDATE album
SET title = 'Le Signe des ténèbres',
    dargaud_publication_date = '25.08.1994',
    scenario = 'François Froideval',
    drawing = 'Olivier Ledroit',
    isbn_ean = '9782205043754',
    release_year = 1994,
    summary = 'L’Oracle annonce la venue de celui qui bouleversera l’Empire : Wismerhill entre en scène avec ses compagnons.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-12',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205043754-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-12'
WHERE id = 2;

UPDATE album
SET title = 'Le Vent des Dragons',
    dargaud_publication_date = '25.08.1994',
    scenario = 'François Froideval',
    drawing = 'Olivier Ledroit',
    isbn_ean = '9782205043761',
    release_year = 1994,
    summary = 'Rescapés de Kendhrir, Wismerhill et ses alliés poursuivent leur route vers l’Oracle au milieu des luttes de pouvoir.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-15',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205043761-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-15'
WHERE id = 3;

UPDATE album
SET title = 'La Marque des démons',
    dargaud_publication_date = '25.08.1994',
    scenario = 'François Froideval',
    drawing = 'Olivier Ledroit',
    isbn_ean = '9782205043778',
    release_year = 1994,
    summary = 'À l’Oracle, Wismerhill découvre une part de son destin et affronte une tentation démoniaque qui pourrait le marquer à jamais.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-17',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205043778-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-17'
WHERE id = 4;

UPDATE album
SET title = 'Quand sifflent les serpents',
    dargaud_publication_date = '25.08.1994',
    scenario = 'François Froideval',
    drawing = 'Olivier Ledroit',
    isbn_ean = '9782205043785',
    release_year = 1994,
    summary = 'La montée de la Lune Noire précipite les factions de l’Empire vers un affrontement où Wismerhill et sa bande jouent un rôle décisif.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-3',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205043785-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-3'
WHERE id = 5;

UPDATE album
SET title = 'La Danse écarlate',
    dargaud_publication_date = '27.08.1994',
    scenario = 'François Froideval',
    drawing = 'Olivier Ledroit',
    isbn_ean = '9782205042511',
    release_year = 1994,
    summary = 'La guerre éclate ouvertement et Wismerhill se rallie au maître de la Lune Noire tandis que les armées convergent vers la bataille.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-7',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205042511-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-7'
WHERE id = 6;

UPDATE album
SET title = 'La Couronne des ombres',
    dargaud_publication_date = '01.04.1995',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205042900',
    release_year = 1995,
    summary = 'Alors que l’Empire semble triompher, Wismerhill découvre que les ombres du passé et sa destinée le rattrapent.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-14',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205042900-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-14'
WHERE id = 7;

UPDATE album
SET title = 'De Vents, de Jade et de Jais',
    dargaud_publication_date = '08.03.1997',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205044447',
    release_year = 1997,
    summary = 'Devenu l’un des plus puissants seigneurs de l’Empire, Wismerhill avance vers sa rencontre avec l’Empereur sous une menace grandissante.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-10',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205044447-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-10'
WHERE id = 8;

UPDATE album
SET title = 'Le Glaive de justice',
    dargaud_publication_date = '06.02.1999',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205046243',
    release_year = 1999,
    summary = 'Wismerhill affronte des morts-vivants, gagne de nouveaux pouvoirs et voit l’Empire se préparer à une guerre ouverte.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-11',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205046243-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-11'
WHERE id = 9;

UPDATE album
SET title = 'Les Chants de la négation',
    dargaud_publication_date = '20.05.2000',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205048544',
    release_year = 2000,
    summary = 'Alors qu’un ordre fragile revient, Wismerhill et ses alliés préparent leur vengeance contre l’Empereur et ses partisans.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-2',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205048544-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-2'
WHERE id = 10;

UPDATE album
SET title = 'L''Aigle foudroyé',
    dargaud_publication_date = '14.09.2002',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205050042',
    release_year = 2002,
    summary = 'Manipulé par Haazheel Thorn, Wismerhill mène l’assaut infernal contre l’Empereur dans un conflit gigantesque.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-8',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205050042-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-8'
WHERE id = 11;

UPDATE album
SET title = 'Ave Tenebrae',
    dargaud_publication_date = '04.10.2003',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205053913',
    release_year = 2003,
    summary = 'Ressuscité, Wismerhill accomplit l’ultime outrage pour la Lune Noire et rebâtit l’Empire à sa manière.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-6',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205053913-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-6'
WHERE id = 12;

UPDATE album
SET title = 'La Porte des Enfers',
    dargaud_publication_date = '30.06.2005',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205055610',
    release_year = 2005,
    summary = 'Wismerhill découvre qu’il n’était qu’un pion d’Haazel Thorn tandis que le dernier acte de la saga se met en place.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-9',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205055610-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-9'
WHERE id = 13;

UPDATE album
SET title = 'La Prophétie',
    dargaud_publication_date = '22.09.2006',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205057751',
    release_year = 2006,
    summary = 'Wismerhill se rebelle contre Haazel Thorn, les alliances finales se nouent et l’affrontement conclusif commence.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-13',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205057751-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-13'
WHERE id = 14;

UPDATE album
SET title = 'La Fin des temps',
    dargaud_publication_date = '21.11.2008',
    scenario = 'François Froideval',
    drawing = 'Pontet Cyril',
    isbn_ean = '9782205059601',
    release_year = 2008,
    summary = 'Face aux dieux et aux démons libérés, Wismerhill doit empêcher l’apocalypse dans la conclusion du premier cycle.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-18',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205059601-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-18'
WHERE id = 15;

UPDATE album
SET title = 'Terra secunda - Livre 1/2',
    dargaud_publication_date = '07.12.2012',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205068306',
    release_year = 2012,
    summary = 'Après l’anéantissement du passé, les survivants gagnent un monde nouveau à reconstruire, tandis que Wismerhill affronte un destin inédit.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-20',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205068306-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-20 | https://www.decitre.fr/livres/chroniques-de-la-lune-noire-tome-15-terra-secunda-9782205068306.html'
WHERE id = 16;

UPDATE album
SET title = 'Terra secunda - Livre 2/2',
    dargaud_publication_date = '24.10.2014',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205071825',
    release_year = 2014,
    summary = 'Sur Terra Secunda, Wismerhill découvre les Ophidiens et doit bâtir un empire au cœur d’un monde hostile.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-5',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205071825-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-5'
WHERE id = 17;

UPDATE album
SET title = 'Guerres Ophidiennes',
    dargaud_publication_date = '27.11.2015',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205074338',
    release_year = 2015,
    summary = 'Les humains de Terra Secunda affrontent les Ophidiens, et Wismerhill s’engage lui-même dans la bataille.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-4',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205074338-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-4'
WHERE id = 18;

UPDATE album
SET title = 'Le Trône d''Opale',
    dargaud_publication_date = '28.04.2017',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205075731',
    release_year = 2017,
    summary = 'Après sa victoire contre les Ophidiens, Wismerhill gît inanimé pendant que les complots se poursuivent sur Terra Secunda et aux Enfers.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205075731-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire'
WHERE id = 19;

UPDATE album
SET title = 'Une semaine ordinaire',
    dargaud_publication_date = '26.10.2018',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205077995',
    release_year = 2018,
    summary = 'Entre alliances, armées, démons familiers et éducation d’un enfant-dieu, la vie d’empereur absolu de Wismerhill reste explosive.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-19',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205077995-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-19'
WHERE id = 20;

UPDATE album
SET title = 'Une porte sur l''Enfer',
    dargaud_publication_date = '22.11.2019',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205079470',
    release_year = 2019,
    summary = 'Des cauchemars annoncent à Wismerhill une menace sans nom, alors que l’avenir de l’humanité vacille.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-0',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205079470-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-0'
WHERE id = 21;

UPDATE album
SET title = 'Sic Transit Gloria Mundi',
    dargaud_publication_date = '03.12.2021',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205085044',
    release_year = 2021,
    summary = 'Les Enfers déversent leurs hordes sur Terra Secunda, et Wismerhill blessé doit confier le front à son double.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-1',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205085044-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-1'
WHERE id = 22;

UPDATE album
SET title = 'La Forteresse d''Opale',
    dargaud_publication_date = '22.11.2024',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205200911',
    release_year = 2024,
    summary = 'Wismerhill consolide son pouvoir sur Terra Secunda tandis que les démons et Methraton poursuivent leurs propres desseins.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-21',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205200911-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-21'
WHERE id = 23;

UPDATE album
SET title = 'Qualis Pater, Talis Filius',
    dargaud_publication_date = '14.11.2025',
    scenario = 'François Froideval',
    drawing = 'Fabrice Angleraud',
    isbn_ean = '9782205204605',
    release_year = 2025,
    summary = 'Le double de Wismerhill traite avec les démons aux Enfers pendant que l’empereur poursuit sa marche vers une forme de divinité.',
    dargaud_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-22',
    cover_image_url = 'https://bdi.dlpdomain.com/album/9782205204605-couv.jpg',
    summary_source_url = 'https://www.dargaud.com/bd/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-noire/les-chroniques-de-la-lune-22'
WHERE id = 24;

CREATE INDEX IF NOT EXISTS idx_album_isbn_ean ON album(isbn_ean);
CREATE UNIQUE INDEX IF NOT EXISTS ux_album_isbn_ean ON album(isbn_ean);
CREATE UNIQUE INDEX IF NOT EXISTS ux_album_dargaud_url ON album(dargaud_url);

COMMIT;