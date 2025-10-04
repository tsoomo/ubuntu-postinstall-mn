#!/bin/sh
set -eu

TARGET="$HOME/.vimrc"
BACKUP="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"

echo "[*] Installing .vimrc from GitHub..."

if [ -f "$TARGET" ]; then
  echo "[*] Backing up existing $TARGET to $BACKUP"
  cp "$TARGET" "$BACKUP"
fi

curl https://raw.github.com/tsoommo/tsoomo_vim/master/vimrc /tmp/vimrc-repo
cp /tmp/vimrc-repo/.vimrc "$TARGET"
rm -rf /tmp/vimrc-repo
