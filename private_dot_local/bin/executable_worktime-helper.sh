#!/usr/bin/env bash
# Exit 0 if now is within work time, 1 otherwise.
# Meant for chaining: worktime-helper.sh && some-app
#
# Configurable via env vars:
#   WORKTIME_DAYS   days of week, 1=Mon .. 7=Sun   (default: "1 2 3 4 5")
#   WORKTIME_START  start hour, inclusive, 0-23     (default: 0)
#   WORKTIME_END    end hour, exclusive, 1-24       (default: 24)

days=${WORKTIME_DAYS:-1 2 3 4 5}
start=${WORKTIME_START:-0}
end=${WORKTIME_END:-24}

day=$(date +%u)
hour=$((10#$(date +%H)))

[[ " $days " == *" $day "* ]] || exit 1
((hour >= start && hour < end))
