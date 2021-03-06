#!/usr/bin/env bash
# The MIT License (MIT)
# Copyright Happystack


# TODO 📢
# ☑️


# Imports
# readonly MPATH='/usr/local/runner'
readonly INPUT_MPATH='/usr/local/runner'
readonly input_row="${INPUT_MPATH}/lib/table/row.sh"
readonly HEIGHT="$(tput lines)"
readonly WIDTH="$(tput cols)"
# shellcheck source=./lib/helpers.sh
source "${INPUT_MPATH}/lib/helpers.sh"


##
# input
#
# @desc: take the user input
#
# @usage: input <label> <actionMessage>
#
##
launchInput() {
  # defaults
  local padding=2
  local label=' ⚠️  Current version is 0.3.1'
  local actionMessage='Bumb to version'
  local  response=$3
  local result
  readonly EMPTY=' '
  local file=''
  # local inputWidth=$(( width - ${#label} - ( padding * 2 ) - 3 ))
  # local separatorPosition=$(( ${#label} + ( padding * 2 ) ))

  # if passed, set the label and action
  if [[ "$#" -gt 1 ]]; then
    label=$1
    actionMessage=$2
    file=$3
  fi

  # calculate the number of rows
  inputRowColumns+=($(( ${#actionMessage} + (2 * padding) )))

  # set the content array
  inputRowContent+="\033[1m${EMPTY}${EMPTY}${actionMessage}${EMPTY}${EMPTY}\033[0m~"
  # inputRowContent+="\e[48;5;235m\e[38;5;105mkkkk\e[39\e[0m~"
  inputRowContent+="${SPACE}~"
  # \033[1m \033[0m

  # print the input
  printf "${label}\n"
  printf "$( bash $input_row top --columns="${inputRowColumns[*]}" )"
  printf "$( bash $input_row middle  --content="${inputRowContent}" --columns="${inputRowColumns[*]}" --align='left' )"
  printf "$( bash $input_row bottom --columns="${inputRowColumns[*]}" )"

  # replace cursor to input position
  tput cup $(( HEIGHT - 2 )) "$(( inputRowColumns[0] + 2 ))"

  # catch the input
  local inputWidth=$(( WIDTH - inputRowColumns - 3 ))
  printf '\e[48;5;235m\e[38;5;105m'
  for (( i = 0; i < "${inputWidth}"; i++ )); do
    printf "${EMPTY}"
  done

  # replace cursor to input position
  tput cup $(( HEIGHT - 2 )) "$(( inputRowColumns[0] + 3 ))"
  unhideCursor

  # read the user input
  read result

  printf '\e[39\e[0m'
  removeLines 4
  hideCursor

  # output result
  echo $result > $file
  # echo $result
}


launchInput "$@"
