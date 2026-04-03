---
name: grid-art-beginners
description: 'Enseignez la conception multi-agents conviviale pour debutants avec orchestrateur, planificateur de formes pour grille 1000x1000, coloriseur et redacteur de legende. Utilisez pour workshops, demos, onboarding et explication des roles, handoffs et contrats de sortie.'
argument-hint: 'Decrivez la scene ou l objectif pedagogique, par exemple : creez un visage de robot simple et rendez les handoffs visibles'
user-invocable: true
---
# Grid Art Beginners

Ce skill est concu pour enseigner, pas seulement pour produire une image.

Il soutient un workshop dans lequel des debutants apprennent :
- comment decouper une tache en roles ;
- comment definir un handoff entre agents ;
- comment garder chaque agent dans une frontiere etroite ;
- comment un skill emballe des instructions, des references et des assets de depart.

## Pourquoi ce skill est utile pedagogiquement

L'exercice est volontairement simple :
- le sujet est visuel ;
- la decomposition est facile a expliquer ;
- chaque agent a un espace de decision reduit ;
- les erreurs sont faciles a voir et a discuter.

Le point pedagogique cle est celui-ci : la grille est grande, mais la representation reste compacte. Cela permet au groupe de discuter architecture au lieu de se noyer dans la sortie.

## Ce qu'il faut enseigner explicitement

Quand vous utilisez ce skill, faites remarquer aux apprenants que :
- l'orchestrateur est responsable de la sequence, pas de l'expertise de contenu ;
- le shape planner definit la structure ;
- le colorizer change l'apparence uniquement ;
- le legend writer explique le sens uniquement.

Si les apprenants manquent ces frontieres, la demo perd l'essentiel de sa valeur.

## Deroule recommande

1. Montrer l'architecture dans [references/architecture.md](./references/architecture.md).
2. Expliquer les contrats de sortie dans [references/output-contract.md](./references/output-contract.md).
3. Utiliser le prompt de depart dans [assets/starter-prompt.md](./assets/starter-prompt.md).
4. Faire une pause apres chaque specialiste et demander ce que cet agent etait autorise a changer.
5. Utiliser [references/pedagogy-checkpoints.md](./references/pedagogy-checkpoints.md) pour le debrief.
6. Utiliser [references/review-checklist.md](./references/review-checklist.md) pour evaluer la demo.

## Procedure

1. Commencer par une scene tres simple.
2. Lancer l'orchestrateur.
3. Inspecter la sortie du shape planner avant de continuer.
4. Inspecter la sortie du colorizer et verifier que la geometrie n'a pas change.
5. Inspecter la legende et verifier qu'elle explique au lieu de redesigner.
6. Faire un debrief court centre sur les frontieres et les handoffs.

## Erreurs frequentes chez les debutants

- vouloir un agent qui fait tout ;
- laisser un agent tardif reecrire une decision precedente ;
- optimiser une sortie jolie plutot qu'une frontiere claire ;
- generer trop de donnees pour pouvoir les relire ;
- confondre description de role et contrat de sortie.

## Criteres de succes

Une bonne demo debutante doit montrer :
- une responsabilite claire par agent ;
- un handoff visible entre agents ;
- une representation compacte de la scene ;
- une reponse finale qu'un non-expert peut comprendre ;
- un debrief dans lequel les apprenants peuvent expliquer ce que chaque agent avait, et n'avait pas, le droit de changer.

