#!/bin/sh

source /usr/bin/alacritty-use-theme/use-theme.sh # Includes alacritty-use-theme

set_color_mode() {
  local output_mode
  if [ -z $DAY_NIGHT ]; then
    return
  fi

  update_terminal_colors() {
    # Update Terminal Colors
    if [[ -n $ALACRITTY_USE_SYSTEM_THEME && $ALACRITTY_USE_SYSTEM_THEME -eq 1 ]]; then
      if command -v alacritty-use-theme &> /dev/null; then
        alacritty-use-theme $DAY_NIGHT
      else
        echo "alacritty-use-theme is not installed"
      fi
    fi
  }

  update_terminal_colors
}


set_color_mode $DAY_NIGHT
