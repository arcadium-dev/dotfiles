# .bash_profile is executed by bash for login shells

export BASH_ENV="${HOME}/.bashrc"
export ENV="${BASH_ENV}"

if [[ -f ${BASH_ENV} ]]; then
  source "${BASH_ENV}"
fi

load_profiles() {
  local i files

  LANG=C files="${HOME}/.profile.d/*.sh"

  for i in "${files}"; do
    if [[ -r "${i}" ]]; then
      source "${i}"
    fi
  done
}

load_profiles
