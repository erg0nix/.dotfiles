# ~/.dotfiles/zsh/.zprofile  ── runs once, at login
# ── Home-brew ───────────────────────────────────────────────
if [[ -x /opt/homebrew/bin/brew ]]; then      # Apple-silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then       # Intel
  eval "$(/usr/local/bin/brew shellenv)"
fi

# ── Optional: nvm (Node Version Manager) ───────────────────
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh"        ]] && . "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && . "$NVM_DIR/bash_completion"

# Automatically restore tmux layout when started from WezTerm
if [[ "$TERM_PROGRAM" == "WezTerm" && -n "$TMUX" && ! -f "$HOME/.tmux/.restored" ]]; then
  tmux-resurrect restore
  touch "$HOME/.tmux/.restored"
fi

