#!/usr/bin/env bash
set -e
COVER="/tmp/cover.jpg"
mkdir -p "$(dirname "$COVER")"

ART_URL=$(playerctl metadata mpris:artUrl 2>/dev/null)

if [[ -n $ART_URL ]]; then
    curl -sL --max-time 2 "$ART_URL" -o "$COVER.tmp" && mv "$COVER.tmp" "$COVER"
else
    printf '' > "$COVER"
fi
echo "$COVER"
