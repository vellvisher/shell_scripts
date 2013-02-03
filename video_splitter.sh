#!/bin/sh
#mencoder -ss 01:00:00 0 -endpos 02:00:00 -oac copy -ovc copy movie.avi -o second_half.avi

#Usage is <start> <mins> video.avi

temp_name=$(basename "$3" ".avi")'_temp.avi'
new_name=$(basename "$3" ".avi")'_split.avi'
mencoder -ss $1 -oac copy -ovc copy "$3" -o "$temp_name"
mencoder -endpos $2 -oac copy -ovc copy "$3" -o "$new_name"
rm "$temp_name"
