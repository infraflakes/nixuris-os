#!/usr/bin/env bash
# cpu-temp – live CPU package temperature
cpu_path=$(awk -F: '$2 ~ /Package id 0/ {print $3}' <<<"$(
  for i in /sys/class/hwmon/hwmon*/temp*_input; do
    echo "$(<$(dirname "$i")/name): $(cat "${i%_*}_label" 2>/dev/null || echo "$(basename "${i%_*}")"): $i"
  done
)" | tr -d ' ')
while :; do
  printf "%.0f°C\n" "$(<"$cpu_path")e-3"
  sleep 1
done
