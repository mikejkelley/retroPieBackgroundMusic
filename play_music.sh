#!/bin/bash 

MUSIC_DIR="/home/pi/RetroPie/roms/music" MPG123_CMD="mpg123 -o alsa -a hw:2,0 -Z $MUSIC_DIR/*.mp3" 

# Function to set volume levels 
set_volume() { 
	echo "Setting system volume to $1..."
	amixer -c 2 sset 'Master' $1 unmute 
	amixer -c 2 sset 'Channels' $1 unmute 
	amixer -c 2 sset 'PCM' $1 unmute  # Ensures game sounds are affected
	amixer -c 2 sset 'Speaker' $1 unmute  # Adjusts built-in speakers if present
}

# Ensure previous instances are not interfering echo "Stopping any existing mpg123 processes..." 
pkill -9 mpg123 
sleep 2 # Give time to fully stop 

# Ensure audio device is ready echo "Ensuring audio device is accessible..." 
sleep 3 

# Set volume to x% (you can modify this value) 
set_volume "67%" 

# Start playback 
echo "Starting music playback..." 
$MPG123_CMD 
echo "Music playback stopped."


