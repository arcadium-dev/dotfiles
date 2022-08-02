echo ""
source "${HOME}/bin/agent"

# To automatically load an existing ssh key set the 
# ssh_keys variable.
#
# i.e. declare -A ssh_keys=( [user]=key )
#
# where the user is embedded in the comment of the ssh key.
#
add_ssh_keys() {
  local user key ssh_keys

  for user in "${!ssh_keys[@]}"; do
    key="${ssh_keys[$user]}"
    if [[ -f "${HOME}/.ssh/${key}" ]] && ! grep "${user}" <(ssh-add -l); then
      ssh-add "${HOME}/.ssh/${key}"
    fi
  done
}
add_ssh_keys

ssh-add -l
