#!/bin/bash
# Get the current volume percentage from the default sink
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

# Get the default sink name
sink=$(pactl info | grep 'Default Sink:' | awk '{print $3}')

# Process the sink string to extract a friendly name:
# 1. Remove the "alsa_output." prefix.
# 2. Remove a leading "usb-" if present.
# 3. Remove the ".analog-stereo" suffix.
# 4. Replace underscores with spaces.
# 5. Remove the trailing dash and numbers (e.g., "-00").
friendly=$(echo "$sink" | sed \
    -e 's/^alsa_output\.//' \
    -e 's/^usb-//' \
    -e 's/\.analog-stereo$//' \
    -e 's/_/ /g' \
    -e 's/-.*$//'
)

echo "${friendly}"

