if [[ "${_src_}" == "" ]]; then
  export _src_="${HOME}/src"
fi
if [[ "${_github_}" == "" ]]; then
  export _github_="${_src_}/github.com"
fi

export _arcadium_="${_src_}/arcadium.dev"

# code
export _arcade_="${_arcadium_}/arcade"
export _core_="${_arcadium_}/core"

# deployments
export _f2048_="${_arcadium_}/fly-2048"
export _farcade="${_arcadium_}/fly-arcade"

# dev support
export _onboarding_="${_arcadium_}/onboarding"
export _dotfiles_="${_arcadium_}/dotfiles"

# website
export _arcadium_blog_="${_arcadium_}/arcadium.dev"
