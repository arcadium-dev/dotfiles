echo ""
source "${HOME}/bin/agent"

# To automatically load an existing ssh key set the 
# ssh_keys variable.
#
# i.e. declare -A ssh_keys=( [user]=key )
#
# where the user is embedded in the comment of the ssh key.
#
declare _user _key

for _user in "${!ssh_keys[@]}"; do
  _key="${ssh_keys[${_user}]}"
  if [[ -f "${HOME}/.ssh/${_key}" ]] && ! grep "${_user}" <(ssh-add -l); then
    ssh-add "${HOME}/.ssh/${_key}"
  fi
done

unset _user _key

ssh-add -l
