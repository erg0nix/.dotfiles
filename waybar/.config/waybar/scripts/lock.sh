#!/bin/bash
# Prevent multiple hyprlock instances
if ! pgrep -x hyprlock > /dev/null; then
    hyprlock
fi
