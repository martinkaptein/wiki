#!/bin/bash

# Update pacman

pacman -Syu --noconfirm

# Install all required programs from list

cat archlist.txt | xargs pacman -S --noconfirm
