# BlackMoon DDD Application

Ce document explique comment lancer l'application BlackMoon autour d'un catalogue de bandes dessinees adosse a SQLite.

Le domaine metier est un catalogue BD :
- une serie regroupe plusieurs albums ;
- un album porte ses metadonnees editoriales, sa couverture, son URL de fiche editeur et son statut de possession ;
- un contributeur peut etre credite sur plusieurs albums ;
- la persistance repose sur SQLite via EF Core et des repositories.

## Structure de solution
- `src/BlackMoon.Front`: interface Blazor Server qui consomme les services gRPC du catalogue.
- `src/BlackMoon.Grpc`: backend gRPC web autonome.
- `src/BlackMoon.Host.Wpf`: host WPF qui expose les memes services gRPC dans le process desktop.
- `src/BlackMoon.Application`: couche service et cas d'usage metier.
- `src/BlackMoon.Domain`: entites du domaine catalogue.
- `src/BlackMoon.Infrastructure`: EF Core, DbContext et repositories SQLite.
- `src/BlackMoon.Contracts`: contrats gRPC partages.
- `data/library.sqlite`: base SQLite du catalogue.

## Prerequis
- SDK .NET 9 installe dans l'environnement actuel.
- Le projet WPF est prepare pour cibler `net10.0-windows` quand le SDK .NET 10 sera disponible, avec fallback `net9.0-windows` dans l'environnement courant.
- WebView2 present sur Windows.

## Build
```bash
dotnet restore Workshop-MyAgents.sln
dotnet build Workshop-MyAgents.sln
```

## Lancer le backend gRPC autonome
Depuis la racine du depot :

```bash
dotnet run --project src/BlackMoon.Grpc
```

Le profil HTTP expose le service sur :
- `http://localhost:5117`

Le front est configure pour appeler `http://localhost:5117` dans [src/BlackMoon.Front/appsettings.Development.json](g:\repos\Workshop-MyAgents\src\BlackMoon.Front\appsettings.Development.json).

## Lancer le front Blazor Server
Dans un second terminal :

```bash
dotnet run --project src/BlackMoon.Front
```

Le front est disponible sur :
- `https://localhost:5001`
- `http://localhost:5000`

En developpement, la redirection HTTPS est desactivee pour permettre au host WPF d'utiliser `http://localhost:5000` sans blocage de certificat.

## Lancer le host WPF
```bash
dotnet run --project src/BlackMoon.Host.Wpf
```

Le host WPF :
- expose directement les services gRPC sur `http://localhost:5117` dans le process WPF ;
- peut lancer le front Blazor comme application distincte ;
- sert de point de controle pour le backend, avec demarrage et arret du host gRPC.

Dans cette topologie :
- l'application WPF joue le role de host backend ;
- le front Blazor consomme les services gRPC exposes par cette application WPF.

## Fonctionnalites catalogue du front
Le front catalogue prend en charge :
- la recherche texte sur le titre, la serie, le resume, la date de parution, l'annee et les illustrateurs ;
- le filtrage par serie ;
- le filtrage par possession avec les vues `Tous`, `Possedes` et `Manquants` ;
- les couvertures cliquables pour ouvrir la fiche editeur de l'album ;
- un lien editeur explicite fonde sur l'URL metier de l'album ;
- la bascule du statut `Deja possede` avec persistance dans la base SQLite.

La persistance du statut de possession s'appuie sur la colonne `album.is_owned`, ajoutee par la migration `008_add_album_owned_flag.sql`.

## Cas d'usage gRPC exposes
Le contrat gRPC expose les operations suivantes :
- `GetCatalog` : retourne le catalogue ordonne avec les metadonnees de serie, d'illustrateurs et le flag `is_owned`.
- `GetAlbum` : retourne le detail d'un album par identifiant.
- `CreateAlbum` : cree un album et transporte aussi le flag `is_owned`.
- `UpdateAlbum` : met a jour les metadonnees d'un album, y compris `is_owned`.
- `SetAlbumOwned` : met a jour uniquement le statut de possession d'un album.

Ces operations sont exposees a la fois par le backend gRPC autonome et par le host WPF. Les ecritures passent par `CatalogService`, puis par les repositories EF Core vers la base SQLite.

## Base et migrations
La base runtime est `data/library.sqlite`.

Le schema est alimente par les migrations ordonnees de `examples/library-management/migrations/`, notamment :
- `007_add_glenat_series.sql` pour etendre le catalogue a Elric et Hawkmoon ;
- `008_add_album_owned_flag.sql` pour ajouter le statut de possession persistant.

## Tests
```bash
dotnet test Workshop-MyAgents.sln --no-build
```

## Note sur EF Core
La demande cible EF Core 10, mais l'environnement courant dispose du SDK .NET 9. La solution est donc alignee sur EF Core 9 pour rester compilable et executable ici.