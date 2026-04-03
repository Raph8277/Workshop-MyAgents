# Contrat de sortie

Utiliser ce contrat dans la demo pour garder des sorties d'agents stables et faciles a relire.

## Scene Spec

- grid_size : toujours 1000x1000
- background_token : un token provisoire comme background-primary
- shapes : une courte liste d'objets de forme

Chaque objet de forme doit contenir :
- id
- type
- x
- y
- width, radius ou liste de points
- role
- color_token

## Color Plan

- background_color
- resume de palette
- un mapping par token de couleur ou id de forme
- une courte note sur le contraste

## Legend

- title
- 2 a 4 phrases
- une courte liste a puces sur les significations visuelles principales

## Regle pedagogique

Si un agent casse le contrat, corriger d'abord le contrat, pas la prose autour.
