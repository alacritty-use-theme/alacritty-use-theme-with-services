#!/bin/sh


current_mode=$(gsettings get org.gnome.desktop.interface color-scheme)
dark_mode="'prefer-dark'"
light_mode="'prefer-light'"
default="'default'"


set_color_mode() {
  local output_mode
  if [ -z $DAY_NIGHT ]; then
    return
  fi


  if [[ $DAY_NIGHT == 'day' ]]; then
    output_mode=$light_mode
  elif [[ $DAY_NIGHT == 'night' ]]; then
    output_mode=$dark_mode
  fi

  echo "SETTING GTK theme-per-mode $DAY_NIGHT"
  gsettings set org.gnome.desktop.interface color-scheme $output_mode

  update_terminal_colors
}

update_terminal_colors() {
# Update Terminal Colors
  if [[ -n $ALACRITTY_USE_SYSTEM_THEME && $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
    if command -v alacritty-use-theme &> /dev/null; then
      alacritty-use-theme $DAY_NIGHT
    fi
  fi
}

  set_color_mode $DAY_NIGHT
