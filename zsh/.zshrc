# machine-local settings and secrets (not in git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# --- Completion ---
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"
fi
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select                       # Tab cycles a highlighted menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'      # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # colored listings

# --- Shortcuts ---
alias nv='nvim'
alias xx='exit'
alias qq='ssh tuxworld'

# --- Listing ---
alias ls='ls -l'
alias ll='ls -alh'

# --- Git ---
alias gl='git log --oneline --graph --decorate --all'

# --- Config ---
alias nvconf='nvim ~/.config/nvim/init.lua'
alias zshconf='nvim ~/.zshrc'
alias reload='exec zsh'

# --- Functions ---
mkcd() { mkdir -p -- "$1" && cd -- "$1"; }

up() {
  local d="" i
  for (( i = 0; i < ${1:-1}; i++ )); do d+="../"; done
  cd "$d"
}


# --- toolchains ---
[[ -f "$HOME/.ghcup/env" ]] && . "$HOME/.ghcup/env"

if [[ "$OSTYPE" == darwin* ]]; then
  export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources
  export PATH="/Applications/ArmGNUToolchain/15.3.rel1/arm-none-eabi/bin:$PATH"
fi

# --- vi mode ---
bindkey -v
bindkey -M viins 'ji' vi-cmd-mode
KEYTIMEOUT=20

# --- prompt ---
eval "$(starship init zsh)"

# --- plugins: syntax highlighting must stay last ---
[[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
