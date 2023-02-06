# zsh profile
source $ZDOTDIR/.zprofile

# Preferences
bindkey -v # Vim bindings in the terminal
export KEYTIMEOUT=1 # Make inputting more responsive

## History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

## Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

## Colors
autoload -Uz colors && colors

## Prompt
PROMPT=' ' # This will be the default if something doesn't load right

## Aliases
[ -f $ZDOTDIR/.aliases ] && source $ZDOTDIR/.aliases

## Default apps
export EDITOR='nvim'
export MANPAGER='nvim +Man!'

## Options
setopt interactive_comments # Lets you write comments in commands without error
setopt autocd # Don't have to use cd to change directories; just use the dir name
setopt extendedglob # Adds more glob features like matching a range with <x-y>
setopt nomatch # When a globbing expr has no match, print the error from the calling tool
zle_highlight=('paste:none') # When pasting, don't highlight
unsetopt BEEP


# Use vim keys in tab complete menu:
bindkey -M menuselect 's' vi-backward-char
bindkey -M menuselect 'n' vi-up-line-or-history
bindkey -M menuselect 't' vi-forward-char
bindkey -M menuselect 'e' vi-down-line-or-history


# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# Alternate between background processes
ctrlz() {
  if [[ $#BUFFER == 0 ]]; then
    fg >/dev/null 2>&1 && zle redisplay
  else
    zle push-input
  fi
}
zle -N ctrlz
bindkey '^Z' ctrlz


# Plugins
source $ZDOTDIR/zsh-mod-manager

export PLUGINS=() # Export PLUGINS to make sure zsh-mod-manager can access it
export RESPONSE # Used to tell user to restart shell

zsh_set_theme "romkatv/powerlevel10k" "powerlevel10k.zsh-theme" 1
zsh_add_plugin "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"

zsh_add_plugin "none9632/zsh-sudo" "zsh-sudo.zsh"
bindkey -M vicmd '^Y' sudo-command-line # Ctrl+y prefixes cmd with sudo
bindkey -M viins '^Y' sudo-command-line

if [ ! -z $RESPONSE ]; then # Fixes issue with blank line being added if no plugins are added
	echo $RESPONSE
	RESPONSE=""
fi

zsh_remove_unnecessary_plugins
