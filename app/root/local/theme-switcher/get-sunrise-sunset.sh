#! /bin/bash

source /root/local/theme-switcher/src/shared-variables.sh


lookup_day_or_night=$(redshift -vop -l manual:42.4509:-83.6618 | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$' | tr [A-Z] [a-z]) # tr API tr from, to

if [[ $lookup_day_or_night == $RDSHFT_DAY ]]; then
  result=$DAY_MODE
elif [[ $lookup_day_or_night == $RDSHFT_NIGHT ]]; then
  result=$NIGHT_MODE
fi

save_configuration() {
  local -r day_night_mode=$(cat $DAY_NIGHT_MODE_PATH)

  # if result is defined and differs from what is saved
  echo ::DEBUG:: outside
  if [[ -v result && ($day_night_mode != $result) ]]; then
    # Create file if one does not already exist
    echo "::DEBUG:: check"

    if [[ ! -f  $DAY_NIGHT_MODE_PATH ]]; then
      touch $DAY_NIGHT_MODE_PATH
    fi

    echo "::DEBUG:: save"
    echo $result > $DAY_NIGHT_MODE_PATH

    echo "----testing----"

    echo "::DEBUG:: return"
    echo $result
    exit 0
  fi
}

save_configuration
