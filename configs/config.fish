if status is-interactive
    # Commands to run in interactive sessions can go here
    alias t="open -a Finder ."
    alias con="ssh root@martinkaptein.com"
    alias tsm="transmission-remote"
    alias v="vim"
    alias f="finder.sh"
    alias dbpull="cp ~/pdb/pdbx.kdbx ~/pdb/bak/$(date "+%Y%m%d%H%M%Slocal"); rsync -P root@martinkaptein.com:/root/pdb/pdbx.kdbx ~/pdb/pdbx.kdbx"
    alias dbpush="rsync -P root@martinkaptein.com:/root/pdb/pdbx.kdbx ~/pdb/bak/$(date "+%Y%m%d%H%M%Sremote"); rsync -P ~/pdb/pdbx.kdbx root@martinkaptein.com:/root/pdb/pdbx.kdbx"
end
