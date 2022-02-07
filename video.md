# Video command line stuff

## FFMPEG

### Cut video without reencoding:

`ffmpeg -ss 00:00:12 -to 00:03:43 -i input.mp4 -c copy ~/Downloads/output.mkv`

### Concat:

`ffmpeg -f concat -i list.txt -c copy output.mkv`

In the list:

```
file file1.mp4
file file2.mp4
.
.
.
```

### Save stream

```
ffmpeg -i "https://stream.m3u8" -c copy output.mkv

```

### Convert

```
ffmpeg -i input.ext output.ext
```

Fancy mp3:

```
ffmpeg -i input.flac -ab 320k -map_metadata 0 -id3v2_version 3 output.mp3
```
