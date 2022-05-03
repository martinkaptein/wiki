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
