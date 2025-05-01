#!/usr/bin/env bash
CONFIG="$HOME/.config/hypr/Scripts/config"

sleep 0.5s; swaylock --config ${CONFIG} & disown
