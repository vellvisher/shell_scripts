#!/bin/sh

ffmpeg -i "$1" -vcodec prores -profile 3 -acodec pcm_s24be -vf setdar=16:9 -f mov "$(basename "$1" .avi).mov"
