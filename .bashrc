#!/usr/bin/env bash

load_rc() {
  local i files

  LANG=C files="${HOME}/.rc.d/*.sh"

  for i in "${files}"; do
    if [[ -r "${i}" ]]; then
      source "${i}"
    fi
  done
}

load_rc
