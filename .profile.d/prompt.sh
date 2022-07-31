if [ "$(uname)" = "Darwin" ]; then
  export PS1="\n\[\e[00;93m\t \[\e[00;94m\]\u@$hostname \[\e[00;92m\]\w\[\e[00;37m\]\n>\[\e[0m\] "
else
  export PS1="\n\[\e[00;93m\t \e[00;94m\]\u@$hostname \[\e[00;92m\]\w\[\e[00;37m\]\n>\[\e[0m\] "
fi
export PS2="more...[$LOGNAME]: "
export PS3="Which one? "

PROMPT_DIRTRIM=3
