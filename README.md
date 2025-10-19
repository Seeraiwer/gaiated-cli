<div align="center"><h1>Gaiated-CLI</h1>
<div>
    <img src="img/bash.svg" style="margin-right: 5px;"> 
    <img src="img/os.svg" style="margin-right: 5px;">
</div>
<hr>
<b>Un script pour rechercher des traces potentielles d'identifiants Google (GaiaID)</b>
</div>

## À propos

Gaiated-CLI est un outil en ligne de commande qui permet de rechercher des traces potentielles d'un identifiant Google (GaiaID) sur différents services Google. Le script ouvre automatiquement plusieurs URLs dans votre navigateur par défaut pour faciliter la recherche.

## Prérequis

- Système d'exploitation Linux avec un environnement graphique
- Bash (installé par défaut sur la plupart des distributions Linux)
- `xdg-open` (généralement installé par défaut)

## Installation

Aucune installation n'est nécessaire. Rendez simplement le script exécutable :

```bash
chmod +x gaiaID2url.sh
```

## Utilisation

### Mode interactif

Lancez simplement le script sans arguments :

```bash
./gaiaID2url.sh
```

Le script vous demandera alors de saisir un GaiaID.

### Mode avec arguments

Vous pouvez également spécifier directement un GaiaID en utilisant l'option `-s` ou `--selector` :

```bash
./gaiaID2url.sh -s 12345678901234567890
```

### Options disponibles

- `-h`, `--help` : Affiche l'aide
- `-v`, `--verbose` : Affiche les informations de débogage
- `-s`, `--selector` : Spécifie un GaiaID à rechercher

## Qu'est-ce qu'un GaiaID ?

Un GaiaID est un identifiant unique attribué par Google à chaque compte utilisateur. Il s'agit d'un nombre composé de 21 chiffres. Cet identifiant peut être trouvé dans diverses URLs de services Google.

## Services explorés

Le script recherche des traces du GaiaID dans les services suivants :

1. **Google Maps** - Contributions de l'utilisateur
2. **Google Plus** (archivé) - Pages de profil archivées
3. **Google Album Archive** (archivé) - Albums photos archivés

## Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Auteur

© 2022 Seeraiwer
