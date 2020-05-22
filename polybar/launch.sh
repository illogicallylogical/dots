#! /bin/bash
#
# launch.sh
# Copyright (C) 2020 undefined <undefined>
#
# Distributed under terms of the MIT license.
#

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#Multi monitor identifier
if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload dpimon &
	done
else
	polybar --reload dpimon &
f

# Launch Polybar, using default config location ~/.config/polybar/config
polybar dpimon &

echo "Polybar launched..." 

