alias gs="git status; echo '';  git lsignore | sed -e 's/^h /Ignoring /'"

alias ga="git add"

alias gd="git diff -w --color --unified=10 --no-prefix"
alias gdc="git diff -w --color --unified=10 --no-prefix --cached"

alias gc="git commit -S -m"
alias gca="git commit --amend"
alias gcn="git commit --amend --no-edit"

alias revert="git checkout --"
alias unstage="git reset HEAD"
alias uncommit="git reset --soft HEAD~1"
