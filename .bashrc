# .bashrc is executed by bash for non-login shells

load_rc() {
  local i files

  LANG=C files="${HOME}/.rc.d/*.sh"

  for i in ${files}; do
    if [[ -r "${i}" ]]; then
      source "${i}"
    fi
  done
}

load_rc
