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
ffmpeg -loop 1 -i "$input_image" -i "$input_audio" -shortest -acodec copy -vcodec mjpeg "$output_video"
