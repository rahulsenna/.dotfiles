#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Java GUI Fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Display Resolution
# xrandr --output Virtual-1 --mode 1920x1080 &
# xrandr --output HDMI-1 --mode 2560x1440 --rate 60 &;
xrandr -s 2560x1440 --rate 60 &


# Compositor
picom -f &

# Wallpaper
nitrogen --restore &

# DWM Status
dwmstatus 2>&1 >/dev/null &

# Loop
while true; do
	dwm >/dev/null 2>&1
done

# Keyboard repeat rate
xset r rate 200 60 &

# Execute DWM
exec dwm &

# 60 Hz Refresh Rate
sleep 10 &
xrandr --rate 60 &


