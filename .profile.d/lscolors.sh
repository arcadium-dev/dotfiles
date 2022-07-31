#!/bin/bash

# a = black
# b = red
# c = green
# d = brown
# e = blue
# f = magenta
# g = cyan
# h = grey
# A = dark grey
# B = bold red
# C = bold green
# D = yellow
# E = bold blue
# F = magenta
# G = cyan
# H = white
# x = default


# And here is a list of the positions in LSCOLORS:
#
# 1. directory
# 2. symbolic link
# 3. socket
# 4. pipe
# 5. executable
# 6. block device
# 7. character device
# 8. executable with setuid set
# 9. executable with setguid set
# 10. directory writable by others, with sticky bit
# 11. directory writable by others, without sticky bit

# The default is “exfxcxdxbxegedabagacad"

export CLICOLOR=1
#export LSCOLORS="DxGxBxDxCxEgEdxbxgxcxd"
#export LSCOLORS="exfxcxdxbxegedabagacad"
export LSCOLORS="Hxfxcxdxbxegedabagacad"
