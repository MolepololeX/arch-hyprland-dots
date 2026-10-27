#!/bin/bash

if [[ "$KITTY_OPACITY" == "1" ]]; then
    kitty @ set-background-opacity 1.0
    export KITTY_OPACITY=0
else
    kitty @ set-background-opacity 0.87
    export KITTY_OPACITY=1
fi
