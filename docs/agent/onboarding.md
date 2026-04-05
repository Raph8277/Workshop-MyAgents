# Onboarding des agents et des skills

Ce document est concu pour aider un nouveau lecteur a comprendre rapidement comment utiliser les agents et les skills du depot.

Il s'adresse a un public fonctionnel, a un chef de projet, a un product owner, a un responsable de domaine, ou a toute personne qui veut savoir:
- ce que les agents savent faire ;
- ce que les skills apportent ;
- comment choisir le bon point d'entree ;
- quels resultats attendre.

## 1. Idee generale

Le depot contient un systeme de travail guide par agents.

Un agent est un role specialise qui sait traiter une categorie de besoin.
Un skill est un cadre methodologique qui apporte un mode operatoire, des references et des conventions.

En pratique:
- l'agent decide et produit ;
- le skill guide et structure ;
- l'orchestrateur coordonne plusieurs agents ;
- le super orchestrateur coordonne l'ensemble du catalogue.

## 2. Les grandes briques

### 2.1 Le super orchestrateur
- `super-workshop-orchestrator` est le point d'entree le plus large.
- Il est adapte lorsqu'un besoin melange plusieurs dimensions: solution .NET, base SQLite, gouvernance Git, documentation, diagrammes, verification finale.
- Il sert de guichet unique.

### 2.2 Les orchestrateurs de famille
- `dotnet-workshop-orchestrator`
- `git-workshop-orchestrator`
- `sqlite-workshop-orchestrator`

Ces orchestrateurs servent quand le besoin est deja clairement rattache a un domaine.

Exemples:
- construire une solution applicative .NET ;
- definir une strategie de branches Git ;
- creer ou faire evoluer une base SQLite.

### 2.3 Les agents specialises
Ils executent une fonction precise.

Exemples:
- concevoir une architecture ;
- produire du code ;
- creer des tests ;
- rediger une documentation ;
- faire un diagramme ;
- generer un schema relationnel ;
- definir une migration ;
- verifier des URL.

### 2.4 Les skills
Les skills sont des guides d'execution reutilisables.

Dans ce depot, on trouve trois skills:
- `dotnet-workshop`
- `git-workshop`
- `sqlite-workshop`

Ils apportent:
- une sequence logique d'etapes ;
- des references documentaires ;
- des conventions de sortie ;
- un cadre commun entre plusieurs agents.

## 3. Que peut-on demander aux agents

## 3.1 Famille .NET
Les agents .NET peuvent:
- concevoir une architecture de solution ou de projets ;
- choisir une decomposition en couches ;
- generer des projets `.csproj` et des fichiers C# ;
- produire des commandes `dotnet build`, `dotnet run`, `dotnet test` ;
- definir une strategie de test ;
- rediger une documentation d'architecture ;
- produire des diagrammes Mermaid.

Cas d'usage typiques:
- demarrer une nouvelle application ;
- structurer un projet existant ;
- documenter une architecture ;
- renforcer la qualite d'une solution.

## 3.2 Famille Git
Les agents Git peuvent:
- definir un modele de branches ;
- recommander une convention de nommage ;
- expliciter les differences entre merge et rebase ;
- fournir les commandes de creation, de publication et de synchronisation d'une branche ;
- produire une documentation de runbook Git ;
- dessiner la topologie des branches et les flux de pull request.

Cas d'usage typiques:
- formaliser la gouvernance Git d'une equipe ;
- preparer une branche de feature ;
- documenter les etapes avant PR ;
- expliquer un flux de merge ou de rebase a un public non expert.

## 3.3 Famille SQLite
Les agents SQLite peuvent:
- modeliser un domaine en tables et relations ;
- produire un schema SQL SQLite ;
- preparer des jeux de donnees ;
- definir des migrations ;
- documenter le schema et les artefacts ;
- produire un diagramme ER Mermaid.

Cas d'usage typiques:
- partir d'un besoin metier et creer une base ;
- faire evoluer un schema existant ;
- enrichir une base de donnees avec des seeds ;
- fournir une documentation de comprehension de la base.

## 3.4 Verification transverse des URL
`url-verification-agent` peut:
- lire des URL dans des fichiers SQL, Markdown, JSON ou donnees generees ;
- verifier si les liens sont actifs, rediriges ou casses ;
- produire un rapport de verification.

Cas d'usage typiques:
- verifier un catalogue d'albums ;
- controler des liens dans une documentation ;
- valider des donnees referencees par URL.

## 4. Que peut-on attendre d'un skill

Un skill ne remplace pas un agent. Il sert a normaliser la facon de travailler.

### Exemple de valeur d'un skill
- il rappelle les etapes a suivre ;
- il propose les references a consulter ;
- il indique l'ordre logique de production ;
- il favorise des livrables homogenes.

### Ce qu'un skill apporte a un public fonctionnel
- plus de regularite dans les livrables ;
- des demarches repetables ;
- une meilleure lisibilite du processus ;
- une reduction des oublis sur les points importants.

## 5. Comment choisir le bon point d'entree

### Choisir le super orchestrateur
Utiliser `super-workshop-orchestrator` si:
- la demande couvre plusieurs domaines ;
- il faut un pilotage centralise ;
- le besoin n'est pas encore bien decoupe ;
- il faut une synthese finale unique.

### Choisir un orchestrateur de famille
Utiliser un orchestrateur de famille si:
- le domaine est deja clair ;
- il faut coordonner plusieurs specialistes d'un meme domaine ;
- on veut une reponse complete mais centree sur un seul sujet.

### Choisir un agent specialise
Utiliser un agent specialise si:
- la demande est tres precise ;
- le besoin porte sur un seul livrable ;
- le domaine et le role sont deja connus.

### S'appuyer sur un skill
Un skill est pertinent si:
- on veut suivre une methode standard ;
- on veut structurer un atelier ou un workshop ;
- on veut garantir une sortie homogone sur plusieurs demandes similaires.
- on veut garantir une sortie homogene sur plusieurs demandes similaires.

## 6. Arbre de decision simple

```text
Besoin utilisateur
  -> est-ce multi-domaines ?
    -> oui : super-workshop-orchestrator
    -> non : domaine deja clair ?
      -> .NET : dotnet-workshop-orchestrator
      -> Git : git-workshop-orchestrator
      -> SQLite : sqlite-workshop-orchestrator
      -> verification de liens : url-verification-agent
  -> besoin tres cible ?
    -> oui : agent specialise du domaine
  -> besoin de methode repetable ?
    -> oui : s'appuyer sur le skill du domaine
```

## 7. Exemples de parcours complets

### Exemple A: lancer un nouveau produit applicatif
Objectif:
creer une application avec architecture, base de donnees, documentation et gouvernance Git.

Parcours recommande:
```text
super-workshop-orchestrator
  -> dotnet-workshop-orchestrator
  -> sqlite-workshop-orchestrator
  -> git-workshop-orchestrator
  -> dotnet-doc-writer ou sqlite-doc-writer selon le besoin
```

Livrables attendus:
- structure de solution ;
- schema de base ;
- documentation ;
- strategie de branche ;
- diagrammes.

### Exemple B: faire evoluer une base existante
Objectif:
ajouter une nouvelle information au schema et documenter l'impact.

Parcours recommande:
```text
sqlite-workshop-orchestrator
  -> sqlite-schema-designer
  -> sqlite-migration-manager
  -> sqlite-doc-writer
  -> sqlite-mermaid-diagrammer
```

Livrables attendus:
- schema cible ;
- script de migration ;
- documentation mise a jour ;
- diagramme ER revise.

### Exemple C: clarifier une pratique de pull request
Objectif:
definir une procedure claire de creation et de synchronisation des branches.

Parcours recommande:
```text
git-workshop-orchestrator
  -> git-branching-designer
  -> git-command-coach
  -> git-doc-writer
  -> git-mermaid-diagrammer
```

Livrables attendus:
- regles de branchement ;
- suite de commandes ;
- documentation pas a pas ;
- schema visuel.

## 8. Resultats attendus par type de public

### Pour un sponsor ou responsable metier
- vision claire des capacites ;
- lisibilite des parcours ;
- meilleure projection sur les livrables.

### Pour un chef de projet
- choix plus simple du bon point d'entree ;
- meilleure comprehension des dependances ;
- capacite a organiser un atelier ou un lot de travail.

### Pour un expert fonctionnel
- meilleure visibilite sur les schemas, documents et diagrammes disponibles ;
- possibilite de demander des livrables cibles.

### Pour une equipe mixte fonctionnelle et technique
- langage commun sur les roles ;
- meilleure coordination ;
- meilleure tracabilite des productions attendues.

## 9. Limites a garder en tete
- Les agents ne remplacent pas la validation metier.
- Les skills ne remplacent pas la decision ; ils aident a mieux cadrer la production.
- Un bon resultat depend d'une demande formulee avec un objectif clair, meme si l'orchestrateur peut aider a la clarifier.

## 10. Resume de prise en main rapide

```text
Si je ne sais pas par ou commencer
  -> j'utilise super-workshop-orchestrator

Si je connais deja le domaine
  -> j'utilise l'orchestrateur de famille

Si je veux un livrable tres cible
  -> j'utilise un agent specialise

Si je veux une methode stable et repetable
  -> je m'appuie sur le skill du domaine
```

## 11. Documents complements a lire
- [README.md](./README.md)
- [catalogue-fonctionnel.md](./catalogue-fonctionnel.md)
- [dependances-et-arbres.md](./dependances-et-arbres.md)
- [../dotnet-workshop.md](../dotnet-workshop.md)
- [../git-workshop.md](../git-workshop.md)
- [../sqlite-workshop.md](../sqlite-workshop.md)
