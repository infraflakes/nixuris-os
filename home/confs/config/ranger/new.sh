#!/usr/bin/env bash
name="$1"
if [[ "${name}" == */ ]]; then
  mkdir -p "${name}"
else
  touch "${name}"
fi
