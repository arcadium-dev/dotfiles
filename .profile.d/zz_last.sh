echo -e "\n${hostname}, $(uname -msr)"

if command -v tmux >/dev/null 2>&1 && tmux ls >/dev/null 2>&1; then
  echo ""
  tmux ls 2>/dev/null
fi

if [[ -d ~/.projects.d ]]; then
  for _yyz in ~/.projects.d/*; do
    source $_yyz
  done
  unset _yyz
fi
