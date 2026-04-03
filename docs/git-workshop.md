# Git Workshop

Ce workshop montre comment decomposer un sujet Git en plusieurs agents specialises.

## Parcours principal
1. Definir la branche de base.
2. Creer une branche locale.
3. Publier la branche sur `origin`.
4. Preparer la pull request.
5. Choisir le mode d'integration: merge ou rebase.
6. Produire un schema Mermaid du branching.

## Exemple de creation locale et distante
```bash
git checkout dev
git pull origin dev
git checkout -b feature/mon-sujet
git push --set-upstream origin feature/mon-sujet
```

## Exemple de preparation de PR en mode merge
```bash
git checkout feature/mon-sujet
git fetch origin
git merge origin/dev
git push
```

Ce mode preserve l'historique de branche et cree en general un commit de merge lors de l'integration finale.

## Exemple de preparation de PR en mode rebase
```bash
git checkout feature/mon-sujet
git fetch origin
git rebase origin/dev
git push --force-with-lease
```

Ce mode linearise l'historique, mais reecrit l'historique de la branche feature avant la PR ou sa mise a jour.

## Diagramme Mermaid merge
```mermaid
gitGraph
    commit id: "dev-1"
    branch feature/mon-sujet
    checkout feature/mon-sujet
    commit id: "feat-1"
    commit id: "feat-2"
    checkout dev
    merge feature/mon-sujet
```

## Diagramme Mermaid rebase
```mermaid
gitGraph
    commit id: "dev-1"
    branch feature/mon-sujet
    checkout feature/mon-sujet
    commit id: "feat-1"
    checkout dev
    commit id: "dev-2"
    checkout feature/mon-sujet
    commit id: "rebased-feat-1"
```
