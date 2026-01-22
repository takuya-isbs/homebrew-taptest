#!/bin/bash
set -euo pipefail
set -x

# Usage:
#   ./check-before-push.sh USERNAME/

# local TAP (brew tap)
TAP=$1

formula_list() {
    ls -1 Formula/*.rb | sed -e 's/.*\///' -e 's/\.rb$//'
}

brew style ./Formula/

for name in $(formula_list); do
    formula=${TAP}/${name}
    brew install $formula
    brew audit --formula $formula
    if [ ${UNINSTALL:-0} = 1 ]; then
	brew uninstall $name
    fi
done
