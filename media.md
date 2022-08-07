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

### Download Audio only

```
youtube-dl -x --audio-format mp3 url
```

### Download numbered playlist to audio (mp3).

```
youtube-dl --extract-audio --audio-format mp3 -o "%(playlist_index)s-%(title)s.%(ext)s" "https://www.youtube.com/watch?v=3PZlve77LAI&list=PLJHAmFz9mLV-CCH7vsG-uOdDUY4Z7iSGW" --playlist-start 30
```

## Split mp3 according to CUE file


```
mp3splt -c file.cue -o @n+-+@t biginput.mp3
```

Can also work with .ogg files.

# Minimize pdf's with Ghostscript

```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
-dNOPAUSE -dBATCH -dColorImageResolution=150 \
-sOutputFile=output.pdf someBigFile.pdf
```

# Prepare image for scan version using Imagemagick

```
 magick convert "*.JPG" -type "Grayscale" -threshold "42%" "out.jpg"
```

You might want to play around with the value.