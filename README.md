# Workshop-MyAgents

Workshop sur la conception d'agents specialises autour de Git, de SQLite, de .NET, de leur documentation et des schemas Mermaid.

Le depot inclut aussi une application de demonstration BlackMoon autour d'un catalogue de bandes dessinees alimente par SQLite, expose via gRPC et consomme par un front Blazor Server.

Le depot contient un parcours centre sur :
- un orchestrateur qui coordonne plusieurs agents specialises ;
- des agents dedies a l'usage de Git ;
- des agents dedies a la conception et a la generation de bases SQLite ;
- des agents dedies au developpement .NET ;
- un agent dedie a la documentation ;
- un agent dedie aux schemas Mermaid pour representer les strategies de branching ;
- un skill dedie a la creation de branches locales et `origin`, puis a la preparation de PR en mode merge ou rebase ;
- un skill dedie a la production de schemas SQLite, de bases de donnees, de documentation Markdown et de diagrammes Mermaid ;
- un skill dedie a la conception de solutions .NET, a la production de code C#, aux tests, a la documentation et aux diagrammes Mermaid.

## Objectif

Montrer comment decomposer un sujet technique en plusieurs responsabilites claires :
- comprendre un besoin Git ;
- comprendre un besoin de modelisation SQLite ;
- comprendre un besoin de developpement .NET ;
- proposer une strategie de branches ;
- proposer un schema relationnel ;
- proposer une architecture de solution .NET ;
- produire des commandes ou procedures ;
- produire des scripts SQL et une base SQLite ;
- produire du code C#, des projets et des tests ;
- documenter le workflow ;
- representer visuellement le branching en Mermaid ;
- representer visuellement le modele de donnees en Mermaid ;
- representer visuellement l'architecture applicative en Mermaid ;
- couvrir la creation de branches locales et distantes ;
- expliciter les PR de type merge ou rebase.

## Composants principaux

- [.github/agents/git-workshop-orchestrator.agent.md](.github/agents/git-workshop-orchestrator.agent.md)
- [.github/agents/git-command-coach.agent.md](.github/agents/git-command-coach.agent.md)
- [.github/agents/git-branching-designer.agent.md](.github/agents/git-branching-designer.agent.md)
- [.github/agents/git-doc-writer.agent.md](.github/agents/git-doc-writer.agent.md)
- [.github/agents/git-mermaid-diagrammer.agent.md](.github/agents/git-mermaid-diagrammer.agent.md)
- [.github/skills/git-workshop/SKILL.md](.github/skills/git-workshop/SKILL.md)
- [.github/agents/sqlite-workshop-orchestrator.agent.md](.github/agents/sqlite-workshop-orchestrator.agent.md)
- [.github/agents/sqlite-schema-designer.agent.md](.github/agents/sqlite-schema-designer.agent.md)
- [.github/agents/sqlite-db-builder.agent.md](.github/agents/sqlite-db-builder.agent.md)
- [.github/agents/sqlite-data-inserter.agent.md](.github/agents/sqlite-data-inserter.agent.md)
- [.github/agents/sqlite-migration-manager.agent.md](.github/agents/sqlite-migration-manager.agent.md)
- [.github/agents/sqlite-doc-writer.agent.md](.github/agents/sqlite-doc-writer.agent.md)
- [.github/agents/sqlite-mermaid-diagrammer.agent.md](.github/agents/sqlite-mermaid-diagrammer.agent.md)
- [.github/agents/url-verification-agent.agent.md](.github/agents/url-verification-agent.agent.md)
- [.github/skills/sqlite-workshop/SKILL.md](.github/skills/sqlite-workshop/SKILL.md)
- [.github/agents/dotnet-workshop-orchestrator.agent.md](.github/agents/dotnet-workshop-orchestrator.agent.md)
- [.github/agents/dotnet-solution-designer.agent.md](.github/agents/dotnet-solution-designer.agent.md)
- [.github/agents/dotnet-implementation-builder.agent.md](.github/agents/dotnet-implementation-builder.agent.md)
- [.github/agents/dotnet-test-and-quality.agent.md](.github/agents/dotnet-test-and-quality.agent.md)
- [.github/agents/dotnet-doc-writer.agent.md](.github/agents/dotnet-doc-writer.agent.md)
- [.github/agents/dotnet-mermaid-diagrammer.agent.md](.github/agents/dotnet-mermaid-diagrammer.agent.md)
- [.github/skills/dotnet-workshop/SKILL.md](.github/skills/dotnet-workshop/SKILL.md)

## Documents utiles

- [docs/git-workshop.md](docs/git-workshop.md)
- [docs/prompts-git-workshop.md](docs/prompts-git-workshop.md)
- [docs/sqlite-workshop.md](docs/sqlite-workshop.md)
- [docs/prompts-sqlite-workshop.md](docs/prompts-sqlite-workshop.md)
- [docs/library-database.md](docs/library-database.md)
- [docs/dotnet-workshop.md](docs/dotnet-workshop.md)
- [docs/prompts-dotnet-workshop.md](docs/prompts-dotnet-workshop.md)
- [docs/blackmoon-ddd-app.md](docs/blackmoon-ddd-app.md)
- [docs/album-url-verification-report.md](docs/album-url-verification-report.md)

## Documentation BlackMoon

La documentation de l'application BlackMoon est organisee autour de trois niveaux :
- [docs/blackmoon-ddd-app.md](docs/blackmoon-ddd-app.md) pour l'architecture applicative, les flux gRPC et le front Blazor ;
- [docs/library-database.md](docs/library-database.md) pour le modele SQLite, les migrations et le schema relationnel ;
- [examples/library-management/README.md](examples/library-management/README.md) pour le mode d'emploi rapide des artefacts SQL et des scripts de build de base.

Ces documents couvrent maintenant :
- la persistance du statut `is_owned` ;
- la migration `008_add_album_owned_flag.sql` ;
- les operations gRPC de catalogue, y compris `SetAlbumOwned` ;
- les capacites UI du front, notamment recherche, filtres serie et possession, couvertures cliquables et lien editeur explicite.

## Positionnement pedagogique

Le systeme est concu pour rendre visibles :
- les frontieres de role ;
- les handoffs entre agents ;
- la difference entre strategie Git, execution Git, documentation et schema Mermaid ;
- la distinction entre branche locale, branche `origin` et mode d'integration de PR ;
- la difference entre modelisation SQLite, generation SQL, documentation Markdown et diagramme Mermaid ;
- la difference entre architecture .NET, implementation C#, qualite logicielle, documentation et diagramme Mermaid.
