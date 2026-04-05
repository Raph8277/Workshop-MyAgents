# Verification des URLs de la table album

Rapport historique : il documente les anciennes URLs directes Dargaud qui figuraient dans le seed avant la mise a jour du jeu de donnees du 2026-04-05. Le seed courant utilise des URLs de couverture `bdi.dlpdomain.com` et des pages album Dargaud.

## Goal
Verifier les URLs stockees dans `album.cover_image_url` pour le catalogue `Les Chroniques de la Lune Noire`.

## Source checked
- Source utilisee: [examples/library-management/seed.sql](examples/library-management/seed.sql)
- Motif de ce choix: l'environnement courant ne dispose pas de `sqlite3`, donc la verification a ete faite sur le seed SQL qui alimente la table `album`.

## Verification method
- Extraction des tuples `id`, `title`, `cover_image_url` depuis le `INSERT INTO album`.
- Verification HTTP par requete `HEAD` sur chaque URL.
- Date de verification: 2026-04-05.

## Summary
- Albums verifies: 24
- URLs valides: 0
- URLs en erreur: 24
- Code d'erreur dominant: `404 Not Found`

## Results

| Id | Album | URL | HTTP | Result |
| --- | --- | --- | --- | --- |
| 1 | En un jeu cruel | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069236_001.jpg | 404 | KO |
| 2 | Le Signe des tenebres | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040709_001.jpg | 404 | KO |
| 3 | Le Vent des dragons | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040716_001.jpg | 404 | KO |
| 4 | La Marque des demons | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040723_001.jpg | 404 | KO |
| 5 | Quand sifflent les serpents | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040730_001.jpg | 404 | KO |
| 6 | La Danse ecarlate | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040747_001.jpg | 404 | KO |
| 7 | La Couronne des ombres | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040754_001.jpg | 404 | KO |
| 8 | De vents, de jade et de jais | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040761_001.jpg | 404 | KO |
| 9 | Le Glaive de justice | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040778_001.jpg | 404 | KO |
| 10 | Les Chants de la negation | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040785_001.jpg | 404 | KO |
| 11 | L'Aigle foudroye | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040792_001.jpg | 404 | KO |
| 12 | Ave Tenebrae | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040808_001.jpg | 404 | KO |
| 13 | La Porte des Enfers | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040815_001.jpg | 404 | KO |
| 14 | La Prophetie | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040822_001.jpg | 404 | KO |
| 15 | La Fin des temps | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205040839_001.jpg | 404 | KO |
| 16 | Terra Secunda (1/2) | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069243_001.jpg | 404 | KO |
| 17 | Terra Secunda (2/2) | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069250_001.jpg | 404 | KO |
| 18 | Guerres ophidiennes | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069267_001.jpg | 404 | KO |
| 19 | Le Trone d'Opale | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205069274_001.jpg | 404 | KO |
| 20 | Une semaine ordinaire | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205070584_001.jpg | 404 | KO |
| 21 | Une porte sur l'enfer | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205070591_001.jpg | 404 | KO |
| 22 | Sic Transit Gloria Mundi | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205089968_001.jpg | 404 | KO |
| 23 | La Forteresse d'Opale | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205200000_001.jpg | 404 | KO |
| 24 | Qualis Pater, Talis Filius | https://www.dargaud.com/sites/default/files/styles/album/public/album/9782205200001_001.jpg | 404 | KO |

## Notes and limitations
- La verification a ete effectuee sur le seed SQL, pas par lecture directe de la base SQLite, faute de client `sqlite3` installe dans l'environnement.
- Le site principal Dargaud repond, mais les URLs d'images stockees dans le seed ne pointent plus vers des ressources existantes.
- Pour corriger durablement le catalogue, il faut soit stocker des URLs valides mises a jour, soit embarquer localement les couvertures dans le projet.