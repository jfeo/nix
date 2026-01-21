#!/usr/bin/env bash
LANG="en_US.utf8"
# Outputs have spaces in them, so let's make \n the IFS
IFS=$'\n'

# Make script independent on particular implementation of send client
if command -v notify-send >/dev/null 2>&1; then
  SEND="notify-send"
elif command -v dunstify >/dev/null 2>&1; then
  SEND="dunstify"
else
  SEND="/bin/false"
fi

# An option was passed, so let's check it
if [ "$@" ]; then
  # the input from the selection will be the desciption.  Save that for alerts
  desc="$*"
  # Figure out what the device name is based on the description passed
  device=$(pactl list sources | grep -C2 "Description: ${desc}$" | grep Name | cut -d: -f2 | xargs)
  # Try to set the default to the device chosen
  if pactl set-default-source "$device"; then
    # if it worked, alert the user
    $SEND -i audio-input-microphone -t 2000 -r 2 -u low "Activated: $desc"
  else
    # didn't work, critically alert the user
    $SEND -i error -t 2000 -r 2 -u critical "Error activating $desc"
  fi
else

  echo -en "\x00prompt\x1f Select Input\n"
  # Get the list of inputs based on the description, which is what makes sense to a human
  # and is what we want to show in the menu
  for x in $(pactl list sources | grep -ie "description:" | cut -d: -f2 | sort); do
    # inputs with cut may have spaces, so use empty xargs to remove them, and output that to the rofi list
    echo "$x" | xargs
  done
fi
