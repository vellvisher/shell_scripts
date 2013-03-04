#!/bin/sh
#mencoder -ss 01:00:00 0 -endpos 02:00:00 -oac copy -ovc copy movie.avi -o second_half.avi

#Usage is <start> <mins> video.avi

temp_name=$(basename "$3")
extension="${temp_name##*.}"
temp_name="${temp_name%.*}"_split
new_name=$temp_name.$extension
ffmpeg -i "$3" -ss $1 -t $2 -c:v copy -c:a copy "$new_name"
