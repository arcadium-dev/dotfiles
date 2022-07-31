_g() {
  local d
  COMPREPLY=()

  for d in $(compgen -v _ | egrep '^_[a-z].*_$' | sed -e "s,^_,," -e "s,_$,,"); do
    if [[ "$d" == "$2"* ]]; then
      COMPREPLY+=("$d")
    fi
  done
}
complete -F _g -o default g
