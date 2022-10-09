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

# Fish examples

```
 	
for i in (find . -name "*.ape"); ffmpeg -i $i (echo $i | sed "s/ape/mp3/g"); end; for j in (find . -name "*.mp3"); mp3splt -c (echo $j | sed "s/mp3/cue/g") -o @n+-+@t $j; end
```
