#!/bin/sh
echo "__UPDATE_THEME__"

THEME_SWITCHER_DIRECTORY="/usr/lib/alacritty-use-theme/bin/theme-switcher"

if [[ -z $DAY_NIGHT ]]; then
  echo "__UPDATE_THEME__No_Change"
  exit 0
fi

# Check for window manager eg (i3wm, gdm)
#if  command -v gdm &> /dev/null; then
sh $THEME_SWITCHER_DIRECTORY/toggle-theme-per-mode.sh
#fi


