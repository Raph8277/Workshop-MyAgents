# Dependances et arbres des agents

Ce document explique comment les agents se relient entre eux.

Pour un public fonctionnel, il faut lire le mot `dependance` comme une relation de travail:
- qui pilote ;
- qui execute une tache specialisee ;
- quel guide methodologique est applique en soutien.

## 1. Vue globale

```mermaid
flowchart TD
    A[Catalogue des agents] --> D1[Orchestrateurs]
  A --> D0[Super orchestrateur]
    A --> D2[Agents specialises]
    A --> D3[Skills methodologiques]
    A --> D4[Agent transverse]

  D0 --> SO[super-workshop-orchestrator]

    D1 --> O1[dotnet-workshop-orchestrator]
    D1 --> O2[git-workshop-orchestrator]
    D1 --> O3[sqlite-workshop-orchestrator]

  SO --> O1
  SO --> O2
  SO --> O3
  SO --> U1[url-verification-agent]

    O1 --> N1[dotnet-solution-designer]
    O1 --> N2[dotnet-implementation-builder]
    O1 --> N3[dotnet-test-and-quality]
    O1 --> N4[dotnet-doc-writer]
    O1 --> N5[dotnet-mermaid-diagrammer]

    O2 --> G1[git-branching-designer]
    O2 --> G2[git-command-coach]
    O2 --> G3[git-doc-writer]
    O2 --> G4[git-mermaid-diagrammer]

    O3 --> S1[sqlite-schema-designer]
    O3 --> S2[sqlite-db-builder]
    O3 --> S3[sqlite-data-inserter]
    O3 --> S4[sqlite-migration-manager]
    O3 --> S5[sqlite-doc-writer]
    O3 --> S6[sqlite-mermaid-diagrammer]

    D3 --> SK1[dotnet-workshop]
    D3 --> SK2[git-workshop]
    D3 --> SK3[sqlite-workshop]

    D4 --> U1[url-verification-agent]
```

## 2. Arbre logique du depot

```text
.github/
  agents/
    super-workshop-orchestrator.agent.md
    dotnet-workshop-orchestrator.agent.md
    dotnet-solution-designer.agent.md
    dotnet-implementation-builder.agent.md
    dotnet-test-and-quality.agent.md
    dotnet-doc-writer.agent.md
    dotnet-mermaid-diagrammer.agent.md
    git-workshop-orchestrator.agent.md
    git-branching-designer.agent.md
    git-command-coach.agent.md
    git-doc-writer.agent.md
    git-mermaid-diagrammer.agent.md
    sqlite-workshop-orchestrator.agent.md
    sqlite-schema-designer.agent.md
    sqlite-db-builder.agent.md
    sqlite-data-inserter.agent.md
    sqlite-migration-manager.agent.md
    sqlite-doc-writer.agent.md
    sqlite-mermaid-diagrammer.agent.md
    url-verification-agent.agent.md
  skills/
    dotnet-workshop/
      SKILL.md
    git-workshop/
      SKILL.md
    sqlite-workshop/
      SKILL.md
```

## 3. Arbre fonctionnel par famille

### Super orchestration transverse
```text
super-workshop-orchestrator
  -> dotnet-workshop-orchestrator
  -> git-workshop-orchestrator
  -> sqlite-workshop-orchestrator
  -> url-verification-agent
  -> peut deleguer directement a des specialistes si la demande est tres ciblee
```

### Famille .NET
```text
dotnet-workshop-orchestrator
  -> dotnet-solution-designer
  -> dotnet-implementation-builder
  -> dotnet-test-and-quality
  -> dotnet-doc-writer
  -> dotnet-mermaid-diagrammer
  -> support methodologique: dotnet-workshop
```

### Famille Git
```text
git-workshop-orchestrator
  -> git-branching-designer
  -> git-command-coach
  -> git-doc-writer
  -> git-mermaid-diagrammer
  -> support methodologique: git-workshop
```

### Famille SQLite
```text
sqlite-workshop-orchestrator
  -> sqlite-schema-designer
  -> sqlite-db-builder
  -> sqlite-data-inserter
  -> sqlite-migration-manager
  -> sqlite-doc-writer
  -> sqlite-mermaid-diagrammer
  -> support methodologique: sqlite-workshop
```

### Agent transverse
```text
url-verification-agent
  -> peut etre appele directement par le super-workshop-orchestrator
  -> peut etre mobilise en appui d'un travail SQLite ou documentaire
```

## 4. Graphes de dependance par famille

### Graphe .NET
```mermaid
flowchart LR
    O[dotnet-workshop-orchestrator] --> A[dotnet-solution-designer]
    O --> B[dotnet-implementation-builder]
    O --> C[dotnet-test-and-quality]
    O --> D[dotnet-doc-writer]
    O --> E[dotnet-mermaid-diagrammer]
    K[dotnet-workshop skill] -. cadre methodologique .-> O
```

### Graphe de super orchestration
```mermaid
flowchart LR
    S[super-workshop-orchestrator] --> D[dotnet-workshop-orchestrator]
    S --> G[git-workshop-orchestrator]
    S --> Q[sqlite-workshop-orchestrator]
    S --> U[url-verification-agent]
    D --> D1[agents .NET specialises]
    G --> G1[agents Git specialises]
    Q --> Q1[agents SQLite specialises]
```

### Graphe Git
```mermaid
flowchart LR
    O[git-workshop-orchestrator] --> A[git-branching-designer]
    O --> B[git-command-coach]
    O --> C[git-doc-writer]
    O --> D[git-mermaid-diagrammer]
    K[git-workshop skill] -. cadre methodologique .-> O
```

### Graphe SQLite
```mermaid
flowchart LR
    O[sqlite-workshop-orchestrator] --> A[sqlite-schema-designer]
    O --> B[sqlite-db-builder]
    O --> C[sqlite-data-inserter]
    O --> D[sqlite-migration-manager]
    O --> E[sqlite-doc-writer]
    O --> F[sqlite-mermaid-diagrammer]
    K[sqlite-workshop skill] -. cadre methodologique .-> O
    U[url-verification-agent] -. controle transversal .-> E
    U -. controle transversal .-> C
```

## 5. Explication des dependances

## Niveau 1: dependances d'orchestration
- Le `super-workshop-orchestrator` constitue le niveau de pilotage le plus haut.
- Les trois orchestrateurs de famille portent ensuite une logique de delegation vers plusieurs sous-agents specialises.
- Cette dependance signifie qu'ils selectionnent un ou plusieurs specialistes selon la nature de la demande.
- Pour un acteur fonctionnel, cela revient a dire qu'un chef d'orchestre principal peut mobiliser des chefs d'orchestre de domaine, puis les experts adaptes.

## Niveau 2: dependances de specialisation
- Les agents specialises n'ont pas vocation a piloter la totalite d'un sujet.
- Ils interviennent sur une partie precise de la chaine de valeur: conception, implementation, qualite, documentation, diagramme, migration, etc.
- Leur dependance a l'orchestrateur est une dependance de coordination, pas une dependance technique forte.

## Niveau 3: dependances methodologiques
- Les skills `dotnet-workshop`, `git-workshop` et `sqlite-workshop` ne sont pas des executants.
- Ils servent de referentiel commun: workflow, ordre logique des etapes, references et conventions.
- Pour un public fonctionnel, ils jouent le role de mode operatoire standardise.

## Niveau 4: dependance transverse de verification
- `url-verification-agent` est autonome.
- Il peut etre mobilise directement par le `super-workshop-orchestrator`, ou venir completer utilement un travail documentaire ou un catalogue de donnees.
- Sa valeur fonctionnelle est de fournir un controle final de coherence externe.

## 6. Lecture par parcours metier

### Parcours A: faire naitre une solution .NET
```text
Besoin metier
  -> super-workshop-orchestrator
    -> dotnet-workshop-orchestrator
    -> design de solution
    -> implementation
    -> qualite et tests
    -> documentation
    -> diagrammes
```

### Parcours B: formaliser une pratique Git
```text
Besoin d'organisation Git
  -> super-workshop-orchestrator
    -> git-workshop-orchestrator
    -> modele de branches
    -> commandes
    -> documentation
    -> schema visuel
```

### Parcours C: construire ou faire evoluer une base SQLite
```text
Besoin donnees
  -> super-workshop-orchestrator
    -> sqlite-workshop-orchestrator
    -> schema
    -> scripts de creation
    -> donnees d'exemple
    -> migrations
    -> documentation
    -> diagrammes ER
    -> verification optionnelle d'URL
```

## 7. Synthese pour les acteurs fonctionnels
- Le `super-workshop-orchestrator` est le point d'entree unique le plus large.
- Les orchestrateurs de famille sont les points d'entree de domaine.
- Les agents specialises produisent les livrables concrets.
- Les skills garantissent une methode stable et repetable.
- Les graphes montrent la chaine de responsabilite.
- Les arbres montrent la structure et l'organisation du catalogue.
