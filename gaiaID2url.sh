#!/usr/bin/env bash
#
# gaiaID2url.sh - Recherche de traces d'un Google User ID (GaiaID)
# Auteur: Seeraiwer
# Licence: MIT

# Vérification des dépendances
check_dependencies() {
  if ! command -v xdg-open &> /dev/null; then
    echo "Erreur: La commande 'xdg-open' n'est pas disponible. Veuillez l'installer."
    exit 1
  fi
}

# Affichage de l'aide
print_usage() {
cat << EOF
Usage : $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-s gaiaID]

Ce script permet de rechercher des traces potentielles d'un Google User ID (GaiaID).

Options disponibles:

-h, --help      Affiche cette aide
-v, --verbose   Affiche les informations de débogage
-s, --selector  Spécifie un GaiaID à rechercher
EOF
  exit 0
}

# Analyse des paramètres
parse_params() {
  while :; do
    case "${1-}" in
    -h | --help) 
      print_usage 
      ;;
    -v | --verbose) 
      set -x 
      ;;
    -s | --selector) 
      if [ -z "${2-}" ]; then
        echo "Erreur: L'option -s nécessite un argument GaiaID."
        exit 1
      fi
      userid="${2-}"
      shift  # Passe au paramètre suivant
      forge_url
      ;;
    -?*) 
      echo "Option inconnue: $1"
      manual_parse 
      ;;
    *) 
      break 
      ;;
    esac
    shift
  done

  # Si aucun argument n'est fourni, passe en mode interactif
  if [ $# -eq 0 ]; then
    manual_parse
  fi

  return 0
}

# Génère et ouvre les URLs associées au GaiaID
forge_url() {
    if [[ ${#userid} -eq 21 ]] && [[ "$userid" =~ ^[0-9]+$ ]]; then
        echo "Recherche de traces pour le GaiaID: $userid"
        echo "Ouverture des URLs dans votre navigateur..."
        
        # Ouvre les URLs dans le navigateur par défaut
        nohup xdg-open "https://google.com/maps/contrib/$userid" > /dev/null 2>&1
        nohup xdg-open "https://web.archive.org/web/*/https://plus.google.com/*/$userid/*" > /dev/null 2>&1
        nohup xdg-open "https://web.archive.org/web/*/https://get.google.com/albumarchive/$userid/*" > /dev/null 2>&1
        
        echo "Recherche terminée avec succès !"
        exit 0
    else
        echo "Erreur: Ce n'est pas un Google ID valide (doit être composé de 21 chiffres)."
        exit 1
    fi
}

# Mode interactif pour saisir un GaiaID
manual_parse() {
    echo "Veuillez entrer un Google UserID (GaiaID) : " 
    read -r userid
    forge_url
}

# Point d'entrée principal
main() {
    check_dependencies
    parse_params "$@"
}

main "$@"
