# Writing notes

## Pandoc Markdown to PDF using wkhtmltopdf

Build command:

```
pandoc -t html5 --css ~/.pandoc/pandoc.css -s --pdf-engine=wkhtmltopdf -o output.pdf input.md
```

## Using Latexbase with custom font

The custom font needs to be already installed.

```
pandoc --pdf-engine=xelatex -V mainfont="Sofia Sans Light" -o output.pdf input.md
```
