#!/bin/bash

# Move config files to kitty config directory
# cp -r kitty ~/.config/

kitty_config_dir=~/.config/kitty
install_themes="git clone --quiet --depth 1 https://github.com/dexpota/kitty-themes.git $kitty_config_dir/kitty-themes"

# Get kitty terminal themes
if [ -d $kitty_config_dir/kitty-themes ]; then
    read -p "Theming already exists. Do you want to override it? (y/n): " input_override
    if [ $input_override == "y" ]; then
        rm -rf $kitty_config_dir/kitty-themes
        eval $install_themes
    fi
else
    eval $install_themes
fi

# Print available themes
ls -1 $kitty_config_dir/kitty-themes/themes

read -p "Choose a theme: " input_theme

if [ ! -f $kitty_config_dir/kitty-themes/themes/$input_theme.conf ]; then
    echo "Theme not found"
    exit 1
else
    ln -sf $kitty_config_dir/kitty-themes/themes/$input_theme.conf $kitty_config_dir/theme.conf
    echo "Theme applied"
fi

