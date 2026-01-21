#!/bin/sh

#-----#
# redshift expected search terms
# subject to change depending on the redshift api
#-----#
RDSHFT_NIGHT='night'
RDSHFT_DAY='daytime'

#-----#
# theme_switcher
#-----#

NIGHT_MODE='night'
DAY_MODE='day'
DAY_NIGHT_MODE_PATH='/usr/share/alacritty-use-theme/theme-switcher/mode'
ALACRITTY_USE_SYSTEM_THEME=$(echo $ALACRITTY_USE_SYSTEM_THEME | grep -o [[:digit:]])

