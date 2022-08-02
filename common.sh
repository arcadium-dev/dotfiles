#!/usr/bin/env bash

#  Copyright 2022 arcadium.dev <info@arcadium.dev>
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.


# shellcheck disable=2034

if [[ "${BASH_COMMON_SH:-}" != "" ]]; then return; fi
declare -r BASH_COMMON_SH="true"

[[ "${DEBUG:-}" != "" ]] && set -o xtrace

set -o errexit
set -o nounset
set -o pipefail
set -o noglob

IFS=$'\t\n'

declare -ri SUCCESS=0
declare -ri FAILURE=1

#
# Logging
#

declare -r ESC=$'\033'
declare -r CLEAR="${ESC}[0;39m"

declare -r RED="${ESC}[1;31m"
declare -r GREEN="${ESC}[1;32m"
declare -r YELLOW="${ESC}[1;33m"
declare -r BLUE="${ESC}[1;34m"
declare -r MAGENTA="${ESC}[1;35m"
if [[ "${DEBUG:-}" != "" ]]; then
  echo -en "${CLEAR}"
fi

#----------------------------------------------------------------------------
# backtrace
#----------------------------------------------------------------------------
function backtrace() {
  local i
  for (( i = 0; i < $(( ${#FUNCNAME[@]} - 1 )); i++ )); do
    printf "at %20s, %20s, line %s\n" \
      "${FUNCNAME[$i]}" \
      "${BASH_SOURCE[$((i + 1))]}" \
      "${BASH_LINENO[${i}]}"
  done
}

#----------------------------------------------------------------------------
# panic ...
#----------------------------------------------------------------------------
function panic() {
  error "$*"
  backtrace
  exit ${FAILURE}
}

#----------------------------------------------------------------------------
# error ...
#----------------------------------------------------------------------------
function error() {(
  IFS=$' '
  local message="$*"
  param_check "${message}"
  echo -e "${RED}Error:${CLEAR} ${message}"
)}

#----------------------------------------------------------------------------
# die ...
#----------------------------------------------------------------------------
function die() {
  error "$*"
  exit ${FAILURE}
}

#----------------------------------------------------------------------------
# warn ...
#----------------------------------------------------------------------------
function warn() {(
  IFS=$' '
  local message="$*"
  param_check "${message}"
  echo -e "${MAGENTA}Warning:${CLEAR} ${message}"
)}

#----------------------------------------------------------------------------
# info
#----------------------------------------------------------------------------
function info() {(
  IFS=$' '
  local message="$*"
  param_check "${message}"
  echo -e "\n${YELLOW}${message}${CLEAR}"
)}

#----------------------------------------------------------------------------
# detail
#----------------------------------------------------------------------------
function detail() {(
  IFS=$' '
  if [[ $# -eq 2 ]]; then
    local heading="${1:-}" body="${2:-}"
    param_check "${heading}" "${body}"
    echo -e "${BLUE}${heading}:${CLEAR} ${body}"
  else
    local message="$*"
    param_check "${message}"
    echo -e "${BLUE}${message}${CLEAR}"
  fi
)}

#----------------------------------------------------------------------------
# msg
#----------------------------------------------------------------------------
function msg() {(
  IFS=$' '
  if [[ $# -eq 0 ]]; then
    local line
    while read -r line; do
      echo -e "${indent:-}${line}"
    done
  else
    local message="$*"
    param_check "${message}"
    echo -e "${indent:-}${message}"
  fi
)}


#
# Results
#

#----------------------------------------------------------------------------
# success
#----------------------------------------------------------------------------
function success() {
  echo -e "${GREEN}Success${CLEAR}"
  return "${SUCCESS}"
}

#----------------------------------------------------------------------------
# failed
#----------------------------------------------------------------------------
function failed() {
  echo -e "${RED}Failed${CLEAR}"
  exit "${FAILURE}"
}


#
# Checks
#

#----------------------------------------------------------------------------
# param_check ...
#----------------------------------------------------------------------------
function param_check() {
  local param
  for param in "$@"; do
    if [[ "${param}" == "" ]]; then
      panic "Missing parameter"
    fi
  done
}

#----------------------------------------------------------------------------
# cmd_check ...
#----------------------------------------------------------------------------
function cmd_check() {
  local cmd
  for cmd in "$@"; do
    if ! type "${cmd}" &>/dev/null; then
      return ${FAILURE}
    fi
  done
  return ${SUCCESS}
}

#
# OS Suppport
#

_os="$(uname)"
declare -r _os

is_darwin() {
  [[ "${_os}" == "Darwin" ]]
}

is_linux() {
  [[ "${_os}" == "Linux" ]]
}
