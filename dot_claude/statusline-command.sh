#!/usr/bin/env bash
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
used=$(echo "$input"  | jq -r '.context_window.used_percentage // empty')
five=$(echo "$input"  | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input"  | jq -r '.rate_limits.seven_day.used_percentage // empty')
out="$model"
[ -n "$used" ] && out="$out | Context: $(printf '%.0f' "$used")% used"
[ -n "$five" ] && out="$out | 5h: $(printf '%.0f' "$five")%"
[ -n "$week" ] && out="$out | 7d: $(printf '%.0f' "$week")%"
printf '%s' "$out"
