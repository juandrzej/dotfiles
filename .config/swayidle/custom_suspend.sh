#!/usr/bin/env bash

if mpc status | grep -qi '\[playing\]'; then
	exit 0
fi
systemctl suspend
