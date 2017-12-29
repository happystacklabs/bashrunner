#!/usr/bin/env bash
# The MIT License (MIT)
# Copyright Happystack


##
# STRICT MODE
##
set -o errexit # Exit on error.
set -o nounset # Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
# Print a helpful message if a pipeline with non-zero exit code
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -o errtrace # Exit on error inside any functions or subshells.
set -o pipefail # Exit immediately if a pipeline returns non-zero.
# set -o xtrace
# Turn on traces, useful while debugging but commented out by default.


##
# Global constants.
##
readonly BINPATH="$(dirname "$0")"


##
# Imports.
##
# shellcheck source=./lib/templates.sh
source "${BINPATH}/lib/templates.sh"
# shellcheck source=./lib/helpers.sh
source "${BINPATH}/lib/helpers.sh"
# shellcheck source=./lib/panel.sh
source "${BINPATH}/lib/panel.sh"


##
# Sratchpad start here:
##
array=()
array+=(50)
array+=(10)
array+=(20)
array+=(90)
array+=(12)

printf "$( templateHeader 'Deploy script' )"
printf "$( panelRow --top --columns="${array[*]}" )"
# printf "$( panelRow --middle --content="dude" )"
printf "$( panelRow --separator --columns="${array[*]}" )"
printf "$( panelRow --middle --columns="${array[*]}" )"
printf "$( panelRow --bottom --columns="${array[*]}" )"
# printf "$( panelRow --top --sections="${contentArray}" )"
# printf "$( panelRow --middle --sections="${contentArray}" )"
# printf "$( panelRow --separator=cross --sections="${contentArray}" )"
# printf "$( panelRow --bottom --sections="${contentArray}" )"