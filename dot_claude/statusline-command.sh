#!/usr/bin/env bash
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
ctx=$(echo "$input"   | jq -r '
  def short:
    if . >= 1000000 then
      ((. / 100000 | round) / 10) as $m
      | (if $m == ($m | floor) then "\($m | floor)" else "\($m)" end) + "M"
    else "\((. / 1000) | round)k"
    end;
  .context_window as $c
  | if $c == null or $c.context_window_size == null then empty
    else
      (($c.current_usage.input_tokens // 0)
       + ($c.current_usage.output_tokens // 0)
       + ($c.current_usage.cache_creation_input_tokens // 0)
       + ($c.current_usage.cache_read_input_tokens // 0)) as $used
      | "\($used | short)/\($c.context_window_size | short)"
    end')
five=$(echo "$input"  | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input"  | jq -r '.rate_limits.seven_day.used_percentage // empty')
out="$model"
[ -n "$ctx" ] && out="$out | Context: $ctx"
[ -n "$five" ] && out="$out | 5h: $(printf '%.0f' "$five")%"
[ -n "$week" ] && out="$out | 7d: $(printf '%.0f' "$week")%"
printf '%s' "$out"
