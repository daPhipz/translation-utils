#!/bin/bash

set -e

# Check if file to translate exists
if [ ! -f "$1" ]; then
    echo "ERROR! File '$1' does not exist, exiting."
    exit 1
fi

# Set up files and variables
FILENAME=$(basename "$1")
TEMPDIR="$HOME/Programming/Translations/.tmp"
mkdir -p "$TEMPDIR"
ORIG_FILE="$TEMPDIR/ORIG-$FILENAME"

# Make a copy of the original state of the file, but keep working on the same file
cp "$1" "$ORIG_FILE"

# Check for 'translator-credits'
if grep --silent "translator-credits" "$1"; then
    notify-send --urgency critical "'translator-credits' found" "Please check if you are in it!"
fi

poedit "$1" &>/dev/null

# Check for translator comment
if ! grep --silent "# Philipp Kiemle <philipp.kiemle@gmail.com>, " "$1"; then
    notify-send --urgency critical "No translator comment" "Make sure to include yourself!"
fi

meld "$ORIG_FILE" "$1" &>/dev/null

# Clean up
rm -rf "$TEMPDIR"
