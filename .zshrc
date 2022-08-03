# Plugins
plugins=( sudo )

export PNPM_HOME="$HOME/local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.config/emacs-configs/.doom-emacs.d/bin:$PATH"

# aliases
alias ls='ls -al --color=auto'
alias vim='nvim'

# Enable vim bindings
# bindkey -v