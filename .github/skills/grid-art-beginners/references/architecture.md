# Architecture

Le systeme comporte quatre roles.

## 1. Orchestrateur

L'orchestrateur recoit la demande utilisateur et decide la sequence de travail.

Il delegue :
- au shape planner pour la geometrie et le placement ;
- au colorizer pour la palette et le contraste ;
- au legend writer pour l'explication lisible par un humain.

## 2. Shape Planner

Le shape planner cree une definition compacte de la scene pour une grille 1000x1000.

Il ne produit pas un million de cellules. A la place, il produit une petite liste de formes comme :
- rectangle
- cercle
- ligne
- polygone

## 3. Colorizer

Le colorizer recoit la definition de scene et assigne les couleurs. Il ne doit ni deplacer ni redesigner les formes.

## 4. Legend Writer

Le legend writer explique la scene finale pour un lecteur humain.

## Pourquoi cette decomposition fonctionne pour des debutants

- chaque role est facile a expliquer ;
- chaque handoff est visible ;
- chaque sortie a un contrat etroit ;
- l'orchestrateur montre la composition sans outillage lourd.
