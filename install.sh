#!/bin/bash
# Install neon-dracula snippet to Obsidian vault

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find vault snippets directory
if [ -n "$1" ]; then
    SNIPPETS_DIR="$1/.obsidian/snippets"
else
    # Default locations to check
    for dir in ~/Notes ~/Documents/Obsidian ~/Obsidian; do
        if [ -d "$dir/.obsidian" ]; then
            SNIPPETS_DIR="$dir/.obsidian/snippets"
            break
        fi
    done
fi

if [ -z "$SNIPPETS_DIR" ]; then
    echo "Could not find Obsidian vault. Usage: ./install.sh /path/to/vault"
    exit 1
fi

mkdir -p "$SNIPPETS_DIR"
cp "$SCRIPT_DIR/neon-dracula.css" "$SNIPPETS_DIR/"

echo "Installed to: $SNIPPETS_DIR/neon-dracula.css"
echo "Enable in Obsidian: Settings → Appearance → CSS Snippets"
