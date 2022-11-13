#!/usr/bin/env bash

print_usage() {
cat << EOF
Usage : $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-s gaiaID]

This script allows you to rotate on Google User ID/GaiaID and their possible traces.

Options disponibles:

-h, --help      Show this 
-v, --verbose   Show debug informations
-s, --selector  Select GaiaID"
EOF
  exit
}

parse_params() {
  flag=0
  param=''

  while :; do
    case "${1-}" in
    -h | --help) print_usage ;;
    -v | --verbose) set -x ;;
    -s | --selector) 
      userid="${2-}"
      forge_url
      ;;
    -?*) manual_parse ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  [[ -z "${param-}" ]] && manual_parse
  [[ ${#args[@]} -eq 0 ]] && manual_parse

  return 0
}

forge_url() {
    if [[ ${#userid} -eq 21 ]] && [[ "$userid" =~ ^[0-9]+$ ]]; then
            nohup xdg-open "https://google.com/maps/contrib/$userid" > /dev/null 2>&1
            nohup xdg-open "https://web.archive.org/web/*/https://plus.google.com/*/$userid/*" > /dev/null 2>&1
            nohup xdg-open "https://web.archive.org/web/*/https://get.google.com/albumarchive/$userid/*" > /dev/null 2>&1
            nohup xdg-open "https://hangouts.google.com/?action=chat&pi=$userid"
            echo "Alles Guet :)"
            exit
    else
        echo "It's not a Google ID (=> 21 numbers)."
    fi
}

manual_parse() {
    echo "UserID Google : " 
    read -r userid
    forge_url
}

parse_params "$@"
