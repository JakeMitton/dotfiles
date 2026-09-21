# machine-local settings and secrets (not in git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# --- aliases ---
alias ls="ls -l"
alias qq="ssh tuxworld"
alias xx="exit"

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
