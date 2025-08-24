#! /usr/bin/env bash
#
# Gets the next appointment from khal and formats the output for Waybar
#
# Synopsis
#   next-appointment.sh [DELTA]
#
# Arguments
#   DELTA  A (date)time range in the format I{m,h,d}, where I is an integer and m means minutes, h
#          means hours, and d means days
#
# Examples
#   next-appointment.sh
#   next-appointment.sh 30m
#   next-appointment.sh 12h
#   next-appointment.sh 7d


set -euo pipefail

DELTA="${1:-1h}"

2>/dev/null khal list \
    -a personal -a family -a entertainment -a the-gallery \
    now "${DELTA}" --notstarted --once \
    --json start-time --json title \
    --json end-time --json location --json description \
  | jq --slurp 'flatten | first' \
  | jq --compact-output '{ "text": if .? then .["start-time"] + " " + .title end, "tooltip": if .? then .title + "\r\r " + .["start-time"] + " - " + .["end-time"] + "\r " + .location + "\r " + .description end }'
