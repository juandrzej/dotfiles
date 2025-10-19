#!/bin/bash
sudo systemctl enable keyd --now

config='[ids]
*
[main]
# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)
tab = overload(meta, tab)
# Remaps the escape key to capslock
# esc = capslock'

echo "$config" | sudo tee /etc/keyd/default.conf >/dev/null

sudo keyd reload
