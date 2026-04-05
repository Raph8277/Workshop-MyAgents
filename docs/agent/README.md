# Documentation des agents

Ce dossier presente les agents du depot pour un public fonctionnel.

L'objectif n'est pas de decrire l'implementation technique ligne par ligne, mais de repondre a quatre questions simples:
- quel agent sert a quoi ;
- dans quel cas il doit etre sollicite ;
- comment les agents cooperent entre eux ;
- quels livrables un acteur fonctionnel peut attendre.

## Lecture recommandee
1. Commencer par [catalogue-fonctionnel.md](./catalogue-fonctionnel.md) pour comprendre les roles metier des agents.
2. Lire ensuite [dependances-et-arbres.md](./dependances-et-arbres.md) pour visualiser les relations entre orchestrateurs, agents specialises et skills.
3. Lire [onboarding.md](./onboarding.md) pour comprendre toutes les possibilites d'usage des agents et des skills.
4. Utiliser les workshops deja presents dans `docs/` pour voir des exemples de production documentaire par domaine.

## Vue d'ensemble
Le depot contient 20 agents.

Ils sont organises en 4 blocs:
- une famille `.NET` pour concevoir, construire, tester et documenter une solution applicative ;
- une famille `Git` pour definir une strategie de branches, les commandes et la documentation associee ;
- une famille `SQLite` pour modeliser des donnees, produire des scripts SQL, gerer des migrations et documenter le schema ;
- un super orchestrateur transverse capable de piloter l'ensemble du catalogue ;
- un agent transverse de verification d'URL pour controler la validite de liens dans les donnees et la documentation.

## Principes de lecture pour un public fonctionnel
- Un `orchestrateur` joue le role de chef d'orchestre. Il analyse la demande, choisit les bons specialistes et assemble le resultat.
- Un `super orchestrateur` joue le role de point d'entree unique quand une demande traverse plusieurs domaines ou quand l'utilisateur veut un pilotage centralise.
- Un `agent specialise` joue un role cible: documentation, diagramme, qualite, commandes, schema, migration, etc.
- Un `skill` est un guide methodologique partage. Il ne remplace pas un agent, mais fournit la methode et les references a appliquer.

## Resultats attendus
Selon le domaine, les agents peuvent produire:
- des documents Markdown utilisables comme support de travail ou de formation ;
- des diagrammes Mermaid pour expliquer une architecture, un flux ou un schema ;
- des scripts SQL, commandes Git ou fichiers de solution .NET ;
- des analyses de qualite, de coherence ou de verification.

## Nouvel agent transverse de pilotage
- `super-workshop-orchestrator` est l'agent de plus haut niveau du depot.
- Il peut orienter une demande vers la famille `.NET`, `Git`, `SQLite`, vers l'agent de verification d'URL, ou combiner plusieurs parcours.
- Il est utile lorsqu'un besoin melange par exemple architecture applicative, base SQLite, documentation, gouvernance Git et controles finaux.

## Structure du dossier
```text
docs/
  agent/
    README.md
    catalogue-fonctionnel.md
    dependances-et-arbres.md
    onboarding.md
```

## Document d'onboarding
- [onboarding.md](./onboarding.md) sert de guide de prise en main.
- Il explique comment choisir entre agent, orchestrateur, specialiste et skill.
- Il decrit aussi les parcours types et les resultats attendus pour un public fonctionnel.

## Liens utiles deja presents dans le depot
- `docs/dotnet-workshop.md`
- `docs/git-workshop.md`
- `docs/sqlite-workshop.md`
- `docs/album-url-verification-report.md`

