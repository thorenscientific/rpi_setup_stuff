#!/bin/bash
#
# add_venv_to_bashrc.sh
#
# Appends a virtualenv activation line to ~/.bashrc, but only if a line
# activating some "venv"-named environment isn't already present.
# This avoids duplicate "source .../activate" lines piling up in .bashrc
# if you run this script more than once.

BASHRC="$HOME/.bashrc"
ACTIVATE_LINE="source ~/my_venv/bin/activate"

# Case-insensitive grep for any existing line that both:
#   - sources an "activate" script, AND
#   - mentions "venv" somewhere in the path (matches .venv, venv, my_venv, etc.)
if grep -iq "source.*venv.*activate" "$BASHRC" 2>/dev/null; then
    echo "A venv activation line already exists in $BASHRC — skipping."
    echo "Existing match:"
    grep -in "source.*venv.*activate" "$BASHRC"
else
    echo "No existing venv activation line found. Adding it now..."
    {
        echo ""
        echo "# Auto-activate my_venv virtual environment"
        echo "$ACTIVATE_LINE"
    } >> "$BASHRC"
    echo "Added: $ACTIVATE_LINE"
fi
