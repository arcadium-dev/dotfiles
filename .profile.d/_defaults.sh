set -o ignoreeof

umask 0077
shopt -s direxpand

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

# Default encoding
export LC_CTYPE=en_US.UTF-8
