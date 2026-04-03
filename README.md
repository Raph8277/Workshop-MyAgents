# Workshop-MyAgents

Workshop de demi-journee pour accompagner la conception d'agents.

Le depot contient maintenant deux parcours complementaires :
- un parcours general de conception d'agents ;
- un parcours debutant multi-agents avec orchestrateur, shape planner, colorizer et legend writer.

## Objectifs pedagogiques

A la fin de la session, les participants doivent etre capables de :

- distinguer un assistant ponctuel d'un agent avec boucle de decision, outils et criteres d'arret ;
- comprendre comment decomposer un probleme en plusieurs agents simples ;
- concevoir un agent sans partir trop vite dans l'implementation ;
- expliciter outils, donnees, garde-fous, criteres d'evaluation et conditions d'escalade ;
- produire un canevas de design d'agent defendable en revue collective.

## Public cible

- developpeurs avec une premiere exposition aux LLM, au prompting ou aux assistants de code ;
- profils produit ou tech leads pouvant participer a la definition d'un cas d'usage ;
- groupes de 6 a 20 personnes, idealement en binomes.

## Hors perimetre

- implementation complete d'un agent de production ;
- benchmark detaille des frameworks ;
- comparaison exhaustive des modeles ;
- discussions purement infra ou achat d'outillage.

## Format recommande

- duree : 3h30 a 4h ;
- animation : 1 facilitateur, 1 support optionnel ;
- mode de travail : alternance de sequences courtes, travail en binomes, restitution ;
- livrable : un canevas de design d'agent ou un exercice multi-agents commente.

## Deroule

1. Cadrage et vocabulaire commun
2. Methode de conception d'un agent
3. Atelier guide sur un cas fil rouge
4. Parcours debutant multi-agents
5. Revue croisee, anti-patterns et standardisation

Le detail minute par minute est disponible dans [docs/agenda.md](docs/agenda.md).

## Parcours debutant multi-agents

Le parcours debutant montre une decomposition simple :
- un orchestrateur ;
- un agent qui planifie des formes dans une grille 1000x1000 ;
- un agent qui colorise ;
- un agent qui redige une legende.

L'objectif pedagogique est de montrer les roles, les handoffs et les contrats de sortie sans demander une implementation complexe.

Points d'entree :
- [docs/parcours-multi-agents-debutants.md](docs/parcours-multi-agents-debutants.md)
- [docs/exemple-sortie-grid.md](docs/exemple-sortie-grid.md)
- [.github/agents/grid-orchestrator.agent.md](.github/agents/grid-orchestrator.agent.md)
- [.github/skills/grid-art-beginners/SKILL.md](.github/skills/grid-art-beginners/SKILL.md)

## Artefacts du workshop

- [docs/agenda.md](docs/agenda.md) : deroule detaille de la demi-journee
- [docs/canevas-design-agent.md](docs/canevas-design-agent.md) : livrable principal a remplir
- [docs/atelier-fil-rouge.md](docs/atelier-fil-rouge.md) : cas d'usage, consignes et questions d'atelier
- [docs/notes-facilitation.md](docs/notes-facilitation.md) : script d'animation et points de debrief
- [docs/checklist-evaluation.md](docs/checklist-evaluation.md) : criteres de revue des canevas produits
- [docs/exemple-rempli.md](docs/exemple-rempli.md) : exemple de corrige pour le facilitateur
- [docs/parcours-multi-agents-debutants.md](docs/parcours-multi-agents-debutants.md) : scenario beginner-friendly pour agents et skills
- [docs/exemple-sortie-grid.md](docs/exemple-sortie-grid.md) : exemple de sortie attendue du systeme multi-agents

## Prerequis

- avoir deja manipule un assistant IA ou un LLM ;
- savoir decrire un flux metier simple ;
- accepter de travailler au niveau design et non implementation ;
- disposer d'un outil de prise de notes collaboratif ou imprimer le canevas.

## Materiel necessaire

- un support de projection ;
- un tableau blanc ou equivalent ;
- un document partage par binome ;
- un minuteur visible pour rythmer les sequences.

## Resultat attendu

Chaque binome repart avec :

- un probleme clairement cadre ;
- une proposition de design d'agent ;
- une liste explicite de risques et garde-fous ;
- une premiere strategie d'evaluation ;
- ou une decomposition multi-agents simple et justifiee.

## Utilisation du depot

1. Commencer par [docs/agenda.md](docs/agenda.md) pour preparer l'animation.
2. Choisir entre le parcours general et le parcours multi-agents debutant.
3. Pour le parcours multi-agents, utiliser [docs/parcours-multi-agents-debutants.md](docs/parcours-multi-agents-debutants.md).
4. Distribuer ou dupliquer [docs/canevas-design-agent.md](docs/canevas-design-agent.md) si vous restez sur l'atelier de design classique.
5. Clore la session avec la revue de [docs/checklist-evaluation.md](docs/checklist-evaluation.md).

## Prochaines extensions possibles

- ajouter une variante par secteur metier ;
- ajouter des slides si un support de presentation devient necessaire ;
- ajouter un module optionnel d'implementation sur une stack cible.
