if status is-interactive
    # Commands to run in interactive sessions can go here
    alias t='open -a Finder .'
    alias v='nvim'
    alias r='ranger'
    alias con='ssh root@sonata8.com'
    alias tsm="transmission-remote"
    alias so='caffeinate -d'
    alias gis='git status'
    alias gip='git pull'
    alias gap='git add -A && git commit -a -m "default commit message" && git push'
    alias gid='git diff'
    alias texpdf='pandoc --pdf-engine=xelatex -V mainfont="Sofia Sans Light" -o'
    alias csspdf='pandoc -t html5 --css ~/.pandoc/pandoc.css -s --pdf-engine=wkhtmltopdf -o'

end

