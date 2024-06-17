#!/bin/bash

# Start the X virtual framebuffer
Xvfb :0 -screen 0 1024x768x16 &

# Start the window manager
startxfce4 &

# Start the PulseAudio server
pulseaudio --start

# Start x11vnc server
x11vnc -display :0 -nopw -listen localhost -xkb &

# Start noVNC
cd /home/chromeos/noVNC && ./utils/novnc_proxy --vnc localhost:5901 --listen 0.0.0.0:6080 &
# You can access the VNC server through http://localhost:6080/vnc.html

# Prevent the script from exiting
tail -f /dev/null