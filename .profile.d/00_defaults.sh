set -o ignoreeof

shopt -s direxpand
shopt -s checkwinsize

# Editor Variables
#
set -o vi
export EDITOR=vim
export VISUAL=vim
export TABSTOP=8
export MORE=
export LESS="-erQM -x${TABSTOP}"
export PAGER=less
export EXINIT="set ts=${TABSTOP} sm"

export _bin_="${HOME}/bin"
export _pkg_="${HOME}/pkg"
export _src_="${HOME}/src"
