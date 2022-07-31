# Shortcuts
#----------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'
alias -- -='cd - &>/dev/null'
alias ~='cd ~'
alias today='date +%Y-%m-%d'
alias ls='ls --color'
alias lsgo='ls --color -1 *.go | grep -v _test'
alias lstest='ls --color -1 *_test.go'
alias llgo='ls --color -l *.go | grep -v _test'
alias lltest='ls --color -l *_test.go'
alias vi="vim"
alias vigo='vi $(lsgo)'
alias vitest='vi $(lstest)'

# Typos
#----------------------------------
alias grpe="grep"
alias xit="exit"
alias exot="exit"
