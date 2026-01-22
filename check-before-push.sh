#!/bin/bash
set -euo pipefail
set -x

# Usage:
#   ./check-before-push.sh USERNAME/

# local TAP (brew tap)
TAP="$1"

brew style "${TAP}"

for filepath in Formula/*.rb
do
  fname="${filepath##*/}"
  formula="${fname%.rb}"
  brew install "${TAP}/${formula}"
  brew audit --formula "${TAP}/${formula}"
  if [[ "${UNINSTALL:-0}" = 1 ]]
  then
    brew uninstall "${formula}"
  fi
done
