# Video command line stuff

## FFMPEG

Cut video without reencoding:

`ffmpeg -ss 00:00:12 -to 00:03:43 -i input.mp4 -c copy ~/Downloads/output.mkv`
