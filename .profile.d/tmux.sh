export TMUX_TMPDIR="${HOME}/.tmux

set_title() {
  local title="$@"
  title="${title:0:32}"
  if [ "$title" = "" ]; then
    title="$(ps -o comm $$ | tail -1)"
  elif [ "$title" != "$@" ]; then
    title="${title}..."
  fi
  printf "\033k%s\033\\" "$title"
}

case ${TERM} in
    screen*)
        trap 'set_title "$BASH_COMMAND"' DEBUG;;
esac
