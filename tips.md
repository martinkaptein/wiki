# Youtube-dl

Download numbered playlist to audio (mp3).

```
youtube-dl --extract-audio --audio-format mp3 -o "%(playlist_index)s-%(title)s.%(ext)s" "https://www.youtube.com/watch?v=3PZlve77LAI&list=PLJHAmFz9mLV-CCH7vsG-uOdDUY4Z7iSGW" --playlist-start 30
```

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
