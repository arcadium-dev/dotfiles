g() {
  if [[ "$1" == "" ]]; then
    return
  fi
  if [[ "$1" == "-" ]]; then cd -; return; fi

  local local_path=""
  local dir="$1"
  if [[ "$(dirname $1)" != "." ]] ; then
    local_path="/${1#*/}"
    dir="${1%%/*}"
  fi
  local tmp="_${dir}_"
  local dest="${!tmp}${local_path}"
  test -n "$dest" -a -d "$dest" && cd "$dest" || echo "Cannot go to '$dir'"
}
