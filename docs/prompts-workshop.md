# Prompts pour le workshop

Ce document propose des prompts prets a l'emploi pour animer le parcours multi-agents debutant.

## 1. Prompt de demarrage

Utiliser ce prompt pour une premiere demonstration simple.

```text
Cree une scene simple pour une grille 1000x1000 que des debutants peuvent comprendre rapidement.

Contraintes pedagogiques :
- utilise un orchestrateur ;
- delegue la geometrie a un shape planner ;
- delegue la palette a un colorizer ;
- delegue l'explication a un legend writer ;
- rends visibles les handoffs entre agents ;
- n'utilise jamais une matrice complete de 1 000 000 de cellules.

Je veux une sortie avec :
1. Objectif
2. Qui Decide Quoi
3. Passages Entre Agents
4. Specification de Scene
5. Plan de Couleurs
6. Legende
7. Notes Pedagogiques
```

## 2. Prompt simple pour bien montrer les roles

```text
Cree un visage de robot tres simple dans une grille 1000x1000.

Regles :
- le shape planner decide uniquement les formes et les positions ;
- le colorizer change uniquement les couleurs ;
- le legend writer explique uniquement le resultat final ;
- a la fin, explique ce que chaque agent etait autorise a changer.
```

## 3. Prompt centré sur les handoffs

```text
Cree une scene de parc avec un lac et un chemin dans une grille 1000x1000.

Je veux que tu mettes l'accent sur les contrats entre agents :
- que recoit exactement le colorizer ;
- que recoit exactement le legend writer ;
- qu'est-ce qui casserait si le colorizer modifiait la geometrie.
```

## 4. Prompt pour montrer pourquoi la decomposition aide

```text
Cree un petit skyline de ville dans une grille 1000x1000.

Objectif pedagogique : montrer qu'un probleme peut etre decoupe en responsabilites simples.

A la fin, ajoute une section Teaching Notes qui explique :
- pourquoi la decomposition en roles rend le resultat plus relisible ;
- pourquoi un seul agent qui fait tout serait moins pedagogique ;
- pourquoi une structure compacte vaut mieux qu'une sortie exhaustive.
```

## 5. Prompt pour exercer le colorizer

Utiliser ce prompt apres une premiere demo, pour montrer qu'on peut changer une seule responsabilite sans tout refaire.

```text
Reprends la meme scene et conserve exactement les formes et les coordonnees.

Cette fois, change seulement la palette pour obtenir une ambiance coucher de soleil.
Explique bien que seul le colorizer a le droit de modifier le rendu visuel.
```

## 6. Prompt pour exercer le legend writer

```text
Garde exactement la meme scene et exactement la meme palette.

Je veux seulement une nouvelle legende plus accessible a un enfant de 10 ans.
Explique a la fin pourquoi le legend writer n'a pas modifie ni les formes ni les couleurs.
```

## 7. Prompt anti-pattern volontaire

Utiliser ce prompt pour faire reagir le groupe, puis demander pourquoi il est mauvais.

```text
Fais une image complete case par case sur une grille 1000x1000.
Ensuite change les formes pendant la phase de colorization si tu trouves une meilleure idee.
Puis laisse le legend writer corriger aussi les coordonnees.
```

Question de debrief : pourquoi ce prompt detruit-il la valeur pedagogique du systeme ?

## 8. Prompt de comparaison bon vs mauvais systeme

```text
Montre deux approches pour la meme scene "soleil sur des montagnes" :
- une bonne approche avec roles bien separes ;
- une mauvaise approche ou les responsabilites se melangent.

Pour chaque approche, explique :
- qui decide quoi ;
- ce qui est facile a relire ;
- ce qui devient fragile.
```

## 9. Prompt de debrief de fin d'atelier

```text
A partir de la scene produite, fais un debrief pedagogique court.

Je veux que tu repondes a ces questions :
- quel agent a decide la geometrie ;
- quel agent a decide l'apparence ;
- quel agent a decide le sens ;
- quel etait le contrat de sortie entre chaque etape ;
- qu'est-ce qui casserait si tous les agents pouvaient tout changer.
```

## 10. Prompt tres court pour demo live

```text
Cree une scene simple, delegue formes, couleurs et legende a trois agents differents, puis rends visibles les handoffs.
```

## Conseils d'usage

- commencer par un prompt tres simple ;
- eviter les scenes trop riches au premier passage ;
- faire verbaliser au groupe ce que chaque agent avait le droit de changer ;
- utiliser les prompts anti-patterns pour provoquer la discussion ;
- reutiliser la meme scene pour montrer qu'un seul agent peut changer une seule dimension.

