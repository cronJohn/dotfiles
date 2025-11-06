# Remove greeting
set -g fish_greeting

# Use vim key bindings
set -U fish_key_bindings fish_vi_key_bindings

# GOAT editor
set -gx EDITOR nvim

# Set up colors
set fish_color_command 23e002
set fish_color_error ff0a02
set fish_color_quote 25e3fc
set fish_color_comment 7f7f7f
set fish_color_autosuggestion 9b9b9b
set fish_color_param f2f2f2


# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# Go
set -U fish_user_paths $fish_user_paths ~/go/bin

# Rust
source "$HOME/.cargo/env.fish"

# Sqlite
fish_add_path /opt/homebrew/opt/sqlite/bin
set -x CGO_ENABLED 1

# ENV vars
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

# Aliases & abbreviations
alias l 'eza --icons=always'

# Zoxide
zoxide init fish | source

# Yazi
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Starship
starship init fish | source
