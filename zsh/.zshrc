# zsh profile
source $XDG_CONFIG_HOME/zsh/.zprofile

# Preferences
## History
bindkey -v # Vim bindings in the terminal
export KEYTIMEOUT=1 # Make inputting more responsive

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

## Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

## Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

## Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Other
setopt interactive_comments # Lets you write comments in commands without error
setopt autocd # Don't have to use cd to change directories; just use the dir name
setopt extendedglob # Adds more glob features like matching a range with <x-y>
setopt nomatch # When a globbing expr has no match, print the error from the calling tool
zle_highlight=('paste:none') # When pasting, don't highlight
unsetopt BEEP

# Colors
autoload -Uz colors && colors


# Default apps
export EDITOR='nvim'
export MANPAGER='nvim +Man!'

# Aliases
alias v='nvim'

# Features
PROMPT=' ' # This will be the default if something doesn't load right

# Themes
source $XDG_CONFIG_HOME/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# Plugins
source "$ZDOTDIR/zsh-mod-manager"

export PLUGINS=() # Export PLUGINS to make sure zsh-mod-manager can access it
export RESPONSE # Used to tell user to restart shell

zsh_set_theme "romkatv/powerlevel10k" "powerlevel10k.zsh-theme" 1
zsh_add_plugin "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
zsh_add_plugin "none9632/zsh-sudo" "zsh-sudo.zsh"

if [ ! -z $RESPONSE ]; then # Fixes issue with blank line being added if no plugins are added
	echo $RESPONSE
fi

# TODO There is an issue when you 'exec zsh' it still prints the message

zsh_remove_unnecessary_plugins
