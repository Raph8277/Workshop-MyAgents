# Catalogue fonctionnel des agents

Ce document decrit chaque agent avec un vocabulaire accessible a un public d'acteurs fonctionnels.

## Comment lire ce catalogue
- `Role` explique la responsabilite principale de l'agent.
- `Quand l'utiliser` indique le type de besoin metier ou organisationnel.
- `Livrables attendus` decrit ce que l'agent produit de facon observable.

## Super orchestrateur transverse

### super-workshop-orchestrator
- Role: pilote l'ensemble du catalogue d'agents depuis un point d'entree unique.
- Quand l'utiliser: quand une demande couvre plusieurs domaines a la fois, ou quand il faut un pilotage centralise de bout en bout.
- Livrables attendus: chemin d'orchestration global, coordination des familles d'agents, synthese finale coherente.

## Famille .NET

### dotnet-workshop-orchestrator
- Role: pilote un chantier .NET de bout en bout.
- Quand l'utiliser: quand il faut transformer un besoin applicatif en solution documentee, implementee et verifiable.
- Livrables attendus: plan de travail, orientation vers les bons specialistes, sortie consolidee.

### dotnet-solution-designer
- Role: concoit la structure de la solution .NET.
- Quand l'utiliser: quand il faut decider comment separer l'application en projets, couches et responsabilites.
- Livrables attendus: architecture cible, decoupage en projets, explication des frontieres entre couches.

### dotnet-implementation-builder
- Role: construit la partie concrete de la solution .NET.
- Quand l'utiliser: quand la solution doit etre transformee en projets, fichiers C# et configuration executable.
- Livrables attendus: code, fichiers `.csproj`, commandes de build et de run.

### dotnet-test-and-quality
- Role: securise la qualite et la verifiabilite de la solution .NET.
- Quand l'utiliser: quand il faut definir une strategie de test, controler la maintenabilite ou preparer une validation.
- Livrables attendus: strategie de test, cas de test representatifs, alertes qualite.

### dotnet-doc-writer
- Role: produit la documentation metier et projet autour d'une solution .NET.
- Quand l'utiliser: quand il faut expliquer l'architecture, les prerequis, les etapes de build ou de test.
- Livrables attendus: guides Markdown, runbooks, notes d'exploitation ou d'onboarding.

### dotnet-mermaid-diagrammer
- Role: transforme l'architecture .NET en schema visuel.
- Quand l'utiliser: quand un public non technique ou mixte a besoin d'une vue rapide et partageable.
- Livrables attendus: diagrammes Mermaid d'architecture, de dependances ou de flux.

## Famille Git

### git-workshop-orchestrator
- Role: pilote un besoin de gouvernance ou de pratique Git.
- Quand l'utiliser: quand il faut clarifier une strategie de branche, une preparation de pull request ou une documentation Git.
- Livrables attendus: parcours de travail, coordination des agents Git, synthese finale.

### git-branching-designer
- Role: definit le modele de branches.
- Quand l'utiliser: quand il faut choisir une branche de base, une convention de nommage ou un mode d'integration.
- Livrables attendus: politique de branches, regles merge/rebase, recommandations de gouvernance.

### git-command-coach
- Role: traduit un processus Git en commandes ordonnees et executables.
- Quand l'utiliser: quand les equipes ont besoin d'une recette operationnelle claire.
- Livrables attendus: suite de commandes Git, explication concise de l'effet de chaque etape.

### git-doc-writer
- Role: documente les pratiques Git.
- Quand l'utiliser: quand il faut fournir un guide de branchement, de synchronisation ou de preparation de PR.
- Livrables attendus: guides Markdown, procedures pas a pas, support de formation.

### git-mermaid-diagrammer
- Role: represente visuellement les scenarios de branchement Git.
- Quand l'utiliser: quand il faut rendre lisible un cycle merge, rebase ou publication sur `origin`.
- Livrables attendus: diagrammes Mermaid de branches et d'integration.

## Famille SQLite

### sqlite-workshop-orchestrator
- Role: pilote un besoin donnees ou base SQLite de bout en bout.
- Quand l'utiliser: quand il faut passer d'un besoin metier a un schema, des scripts, une base et sa documentation.
- Livrables attendus: coordination du travail, articulation entre modelisation, SQL, migration et documentation.

### sqlite-schema-designer
- Role: transforme un domaine metier en modele relationnel.
- Quand l'utiliser: quand il faut definir les entites, attributs, relations et contraintes.
- Livrables attendus: schema logique, conventions de nommage, choix de cles et de relations.

### sqlite-db-builder
- Role: produit les artefacts SQL executables.
- Quand l'utiliser: quand il faut creer les tables, index et etapes de creation de base.
- Livrables attendus: DDL SQLite, script `.sql`, etapes de creation du fichier `.db`.

### sqlite-data-inserter
- Role: construit les jeux de donnees de demonstration ou d'alimentation.
- Quand l'utiliser: quand il faut inserer des donnees coherentes dans le bon ordre.
- Livrables attendus: scripts `INSERT`, donnees de reference, ordonnancement d'insertion.

### sqlite-migration-manager
- Role: gere l'evolution du schema dans le temps.
- Quand l'utiliser: quand il faut ajouter des colonnes, faire evoluer une table ou planifier une migration forward-only.
- Livrables attendus: scripts de migration, strategie d'evolution, points de vigilance.

### sqlite-doc-writer
- Role: documente la structure et l'usage de la base SQLite.
- Quand l'utiliser: quand il faut expliquer les tables, relations, contraintes et artefacts SQL.
- Livrables attendus: dictionnaire de donnees, guide de schema, notes de comprehension.

### sqlite-mermaid-diagrammer
- Role: produit les schemas visuels de type ER.
- Quand l'utiliser: quand un public fonctionnel doit comprendre rapidement les relations entre entites.
- Livrables attendus: diagrammes Mermaid `erDiagram` lisibles et alignes avec la documentation.

## Agent transverse

### url-verification-agent
- Role: controle la validite des URL presentes dans des donnees ou des documents.
- Quand l'utiliser: quand il faut verifier qu'un catalogue, une base, un seed SQL ou une documentation pointe vers des liens vivants.
- Livrables attendus: rapport de verification, statut HTTP, liste des liens valides, rediriges ou cassés.

## Resume par valeur pour les acteurs fonctionnels

### Pour un chef de projet ou product owner
- Les orchestrateurs aident a transformer une demande en parcours de production.
- Les document writers rendent le resultat partageable.
- Les diagrammers rendent le resultat lisible rapidement.

### Pour un responsable qualite ou gouvernance
- `dotnet-test-and-quality` apporte la logique de verification applicative.
- `git-branching-designer` formalise les regles de gouvernance Git.
- `sqlite-migration-manager` formalise la gouvernance des evolutions de schema.
- `url-verification-agent` controle la qualite de liens et references externes.

### Pour un responsable donnees ou referentiel
- `sqlite-schema-designer`, `sqlite-db-builder`, `sqlite-data-inserter` et `sqlite-doc-writer` couvrent la chaine complete des donnees.
