#!/bin/sh
set -eu

TARGET="$HOME/.vimrc"
BACKUP="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"

echo "[*] Installing .vimrc from GitHub..."

if [ -f "$TARGET" ]; then
  echo "[*] Backing up existing $TARGET to $BACKUP"
  cp "$TARGET" "$BACKUP"
fi

# Download the .vimrc directly
curl -fsSL https://raw.githubusercontent.com/tsoommo/tsoomo_vim/master/vimrc -o "$TARGET"
