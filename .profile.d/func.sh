fgo() {
  find . -type f -name "*.go" -exec grep -Hn "$@" {} \;
}

f() {
  find . -type f -exec grep -Hn "$@" {} \;
}

sf() {
  local query="$1"; shift
  grep "${query}" $@ | sed -e "s,:.*$,," | sort -u
}
