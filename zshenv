# user basic env
if [[ -e "${HOME}/.zsh_custom_env" ]]; then
  source "${HOME}/.zsh_custom_env"
fi

export PATH="${HOME}/.local/bin:${PATH}"

# cargo
if [[ -d "${HOME}/.cargo" ]]; then
  . "${HOME}/.cargo/env"
fi

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [[ -d "${PYENV_ROOT}/bin" ]]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init - zsh)"
fi

# nodenv
export NODENV_ROOT="${HOME}/.nodenv"
if [[ -d "${NODENV_ROOT}/bin" ]]; then
  export PATH="${NODENV_ROOT}/bin:${PATH}"
  eval "$(nodenv init - zsh)"
  export PATH="$(nodenv prefix)/bin:${PATH}"
fi

# goenv
export GOENV_ROOT="${HOME}/.goenv"
export GOENV_GOPATH_PREFIX="${HOME}/.go"
if [[ -d "${GOENV_ROOT}/bin" ]]; then
  export PATH="${GOENV_ROOT}/bin:${PATH}"
  eval "$(goenv init - zsh)"
  export PATH="${GOROOT}/bin:${PATH}:${GOPATH}/bin"
fi
