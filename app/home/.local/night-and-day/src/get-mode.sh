#! /bin/bash

source ./.local/night-and-day/src/shared-variables.sh


if [[ "$#" -eq 0 ]]; then
  echo 'missing arguments'
  exit 0
fi


lat=$1; lng=$2
echo $lat:$lng
lookup_day_or_night=$(redshift -vop -l geoclue2 -l $lat:$lng | grep -oP '(?<=Period: )\w+$|(?<=Period: )\w+(?=\))$' | tr [A-Z] [a-z]) # tr API tr from, to

if [[ $lookup_day_or_night == $RDSHFT_DAY ]]; then
  result=$DAY_MODE
elif [[ $lookup_day_or_night == $RDSHFT_NIGHT ]]; then
  result=$NIGHT_MODE
fi

save_mode() {

  local -r day_night_mode=$(cat $DAY_NIGHT_MODE_PATH)
  echo "checkme:: $day_night_mode"

  # if result is defined and differs from what is saved
  echo "check:: redshift: $result != mode_file: $day_night_mode"
  if [[ -v result && ($day_night_mode != $result) ]]; then

    # Create file if one does not already exist
    if [[ ! -f  $DAY_NIGHT_MODE_PATH ]]; then
      touch $DAY_NIGHT_MODE_PATH
    fi

    echo $result > $DAY_NIGHT_MODE_PATH
    cat $DAY_NIGHT_MODE_PATH
  fi
}

save_mode
