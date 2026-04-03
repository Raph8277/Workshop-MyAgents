# Workshop-MyAgents

Workshop sur la conception d'agents specialises autour de Git, de sa documentation et des schemas Mermaid pour le branching.

Le depot contient un parcours centre sur :
- un orchestrateur qui coordonne plusieurs agents specialises ;
- des agents dedies a l'usage de Git ;
- un agent dedie a la documentation ;
- un agent dedie aux schemas Mermaid pour representer les strategies de branching ;
- un skill dedie a la creation de branches locales et `origin`, puis a la preparation de PR en mode merge ou rebase.

## Objectif

Montrer comment decomposer un sujet technique en plusieurs responsabilites claires :
- comprendre un besoin Git ;
- proposer une strategie de branches ;
- produire des commandes ou procedures ;
- documenter le workflow ;
- representer visuellement le branching en Mermaid ;
- couvrir la creation de branches locales et distantes ;
- expliciter les PR de type merge ou rebase.

## Composants principaux

- [.github/agents/git-workshop-orchestrator.agent.md](.github/agents/git-workshop-orchestrator.agent.md)
- [.github/agents/git-command-coach.agent.md](.github/agents/git-command-coach.agent.md)
- [.github/agents/git-branching-designer.agent.md](.github/agents/git-branching-designer.agent.md)
- [.github/agents/git-doc-writer.agent.md](.github/agents/git-doc-writer.agent.md)
- [.github/agents/git-mermaid-diagrammer.agent.md](.github/agents/git-mermaid-diagrammer.agent.md)
- [.github/skills/git-workshop/SKILL.md](.github/skills/git-workshop/SKILL.md)

## Documents utiles

- [docs/git-workshop.md](docs/git-workshop.md)
- [docs/prompts-git-workshop.md](docs/prompts-git-workshop.md)

## Positionnement pedagogique

Le systeme est concu pour rendre visibles :
- les frontieres de role ;
- les handoffs entre agents ;
- la difference entre strategie Git, execution Git, documentation et schema Mermaid ;
- la distinction entre branche locale, branche `origin` et mode d'integration de PR.
