# Java GUI Fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Display Resolution
xrandr --output Virtual-1 --mode 1920x1080 &

# Compositor
picom -f &

# Wallpaper
nitrogen --restore &

# Loop
while true; do
	dwm >/dev/null 2>&1
done


# Execute DWM
exec dwm
