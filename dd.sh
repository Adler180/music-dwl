#!/bin/bash

yt-dlp -f ba --extract-audio --audio-format mp3 --format bestaudio --audio-quality 0 --add-metadata --embed-thumbnail --output "%(title)s.%(ext)s" -i https://youtube.com/watch?v=$(yt-dlp "ytsearch1:$*" --get-id)

