# terminal integration
if [[ ! -n "${SSH_CONNECTION}" ]]; then
  WEZTERM_SH_FILE="${HOME}/.config/zsh/wezterm.sh"
  if [[ -e "${WEZTERM_SH_FILE}" ]]; then
    source "${WEZTERM_SH_FILE}"
  fi
fi

# zim
ZIM_CONFIG_FILE="${HOME}/.config/zsh/zimrc"
ZIM_HOME="${HOME}/.cache/zim"

if [[ ! -e "${ZIM_HOME}/zimfw.zsh" ]]; then
  curl -fsSL --create-dirs -o "${ZIM_HOME}/zimfw.zsh" \
    https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

if [[ ! "${ZIM_HOME}/init.zsh" -nt "${ZIM_CONFIG_FILE}" ]]; then
  source "${ZIM_HOME}/zimfw.zsh" init
fi

if [[ -d "${ZIM_HOME}" ]]; then
  source "${ZIM_HOME}/init.zsh"
fi

# starship
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
if ! which starship >/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- -b "${HOME}/.local/bin" -y
fi
if which starship >/dev/null; then
  eval "$(starship init zsh)"
fi

# atuin (history)
if which atuin >/dev/null; then
  eval "$(atuin init zsh)"
fi

# zoxide
if which zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

# eza
if which eza >/dev/null; then
  alias ls="eza"
fi
EZA_ROOT="${HOME}/.eza"
if [[ -d "${EZA_ROOT}" ]]; then
  export FPATH="${EZA_ROOT}/completions/zsh:${FPATH}"
fi

# select word style
autoload -U select-word-style
select-word-style bash

# customization
alias without_proxy='env http_proxy="" https_proxy=""'

# nvim
if which nvim >/dev/null; then
  export EDITOR="$(which nvim)"
fi

bindkey -e
