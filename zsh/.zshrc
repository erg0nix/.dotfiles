export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# === ROCm HIP Setup ===
export ROCM_PATH=/opt/rocm
export HIP_PATH=/opt/rocm
export PATH="$ROCM_PATH/bin:$PATH"
export HSA_OVERRIDE_GFX_VERSION=11.0.0

# === Cargo & Go Paths ===
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# === Editor Setup ===
export VISUAL=nvim
export EDITOR=nvim

alias zshconf="nvim ~/.zshrc"
alias hyprconf="nvim ~/.config/hypr/hyprland.conf"
alias nvimconf="nvim ~/.config/nvim/init.lua"
alias dotfiles="nvim ~/.dotfiles"

. "$HOME/.local/bin/env"
