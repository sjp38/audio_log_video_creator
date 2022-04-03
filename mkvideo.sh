#!/bin/bash

if [ $# -ne 3 ]
then
	echo "Usage: $0 <input audio> <input image> <output video>"
	exit 1
fi

input_audio=$1
input_image=$2
output_video=$3

convert -resize 1024 "$input_image" "$input_image"
ffmpeg -loop 1 -i "$input_image" -i "$input_audio" -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest "$output_video"
