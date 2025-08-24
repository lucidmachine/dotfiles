#! /usr/bin/env bash
#
# Gets the next appointment from khal and formats the output for Waybar
#
# Synopsis
#   next-appointment.sh
#
# Examples
#   next-appointment.sh

set -euo pipefail

next_appointment="$(
  2>/dev/null khal list \
    -a personal -a family -a entertainment -a the-gallery \
    now 1h --notstarted --once \
    --json start-time --json title \
    --json end-time --json location --json description \
  | jq --slurp 'flatten | first'
)"

if [ "${next_appointment}" == "null" ]; then
  echo "{ \"text\": null, \"tooltip\": null }"
  exit 0
fi

next_appointment_short="$(
  echo "${next_appointment}" \
    | jq --raw-output '.["start-time"] + " " + .title'
)"

next_appointment_long="$(
  echo "${next_appointment}" \
    | jq --raw-output '.title + "\r\r " + .["start-time"] + " - " + .["end-time"] + "\r " + .location + "\r " + .description'
)"

echo "{\"text\": \"${next_appointment_short}\", \"tooltip\": \"${next_appointment_long}\"}"
