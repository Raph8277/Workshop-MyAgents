# Workshop-MyAgents

Workshop sur la conception d'agents specialises autour de Git, de SQLite, de leur documentation et des schemas Mermaid.

Le depot contient un parcours centre sur :
- un orchestrateur qui coordonne plusieurs agents specialises ;
- des agents dedies a l'usage de Git ;
- des agents dedies a la conception et a la generation de bases SQLite ;
- un agent dedie a la documentation ;
- un agent dedie aux schemas Mermaid pour representer les strategies de branching ;
- un skill dedie a la creation de branches locales et `origin`, puis a la preparation de PR en mode merge ou rebase ;
- un skill dedie a la production de schemas SQLite, de bases de donnees, de documentation Markdown et de diagrammes Mermaid.

## Objectif

Montrer comment decomposer un sujet technique en plusieurs responsabilites claires :
- comprendre un besoin Git ;
- comprendre un besoin de modelisation SQLite ;
- proposer une strategie de branches ;
- proposer un schema relationnel ;
- produire des commandes ou procedures ;
- produire des scripts SQL et une base SQLite ;
- documenter le workflow ;
- representer visuellement le branching en Mermaid ;
- representer visuellement le modele de donnees en Mermaid ;
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
- [.github/skills/sqlite-workshop/SKILL.md](.github/skills/sqlite-workshop/SKILL.md)

## Documents utiles

- [docs/git-workshop.md](docs/git-workshop.md)
- [docs/prompts-git-workshop.md](docs/prompts-git-workshop.md)
- [docs/sqlite-workshop.md](docs/sqlite-workshop.md)
- [docs/prompts-sqlite-workshop.md](docs/prompts-sqlite-workshop.md)
- [docs/library-database.md](docs/library-database.md)

## Positionnement pedagogique

Le systeme est concu pour rendre visibles :
- les frontieres de role ;
- les handoffs entre agents ;
- la difference entre strategie Git, execution Git, documentation et schema Mermaid ;
- la distinction entre branche locale, branche `origin` et mode d'integration de PR ;
- la difference entre modelisation SQLite, generation SQL, documentation Markdown et diagramme Mermaid.
