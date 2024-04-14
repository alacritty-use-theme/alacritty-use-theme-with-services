#!/bin/bash

function runner() {
  local default_lat=42.4509
  local default_lng=-83.6618

  . ./.local/night-and-day/src/get-mode.sh ${lat:=$default_lat} ${lng:=$default_lng}
}

runner
