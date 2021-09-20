#!/bin/bash

set -e

# Get filenames
if [[ -n $1 ]]; then
    OLD="$1"
    # Check if file exists
    if [ ! -f "$1" ]; then
        echo "ERROR! File '$1' does not exist, exiting."
        exit 1
    fi
fi

if [[ -n $2 ]]; then
    NEW="$2"
    # Check if file exists
    if [ ! -f "$1" ]; then
        echo "ERROR! File '$1' does not exist, exiting."
        exit 1
    fi
fi
if [[ -n $3 ]]; then
    FINAL="$3"
else
    FINAL="FINAL-$OLD"
fi

# Make a copy of the translation that needs proofreading,
# to which corrections will be saved to
TEMPDIR="$HOME/Programming/Translations/.tmp"
mkdir -p "$TEMPDIR"
CHECKED="$TEMPDIR/checked.po"
cp "$NEW" "$CHECKED"

# Start working
meld "$OLD" "$CHECKED" &>/dev/null
cp "$CHECKED" "$FINAL"
poedit "$FINAL" &>/dev/null
meld "$NEW" "$FINAL" &>/dev/null

# Clean up
rm -rf "$TEMPDIR"
