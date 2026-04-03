# Notes debutants

## Bonne decomposition

Une bonne decomposition ressemble a ceci :
- le shape planner decide ce qui est dessine et ou ;
- le colorizer decide a quoi cela ressemble ;
- le legend writer explique ce que cela signifie ;
- l'orchestrateur gere la sequence.

## Mauvaise decomposition

Une mauvaise decomposition ressemble a ceci :
- chaque agent peut tout changer ;
- il n'y a pas de handoff stable ;
- le colorizer ajoute de nouvelles formes ;
- le legend writer reecrit la geometrie ;
- l'orchestrateur est juste un autre agent generaliste.

## Erreur frequente

L'erreur la plus frequente chez les debutants est d'essayer de representer explicitement toute la grille 1000x1000. Cela produit trop de sortie, cache la lecon de design, et rend chaque handoff plus difficile.
