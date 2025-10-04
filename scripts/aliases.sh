#!/bin/sh
set -eu

TARGET="$HOME/.bash_aliases"
BACKUP="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"

echo "[*] Adding shell aliases..."

if [ -f "$TARGET" ]; then
  echo "[*] Backing up existing $TARGET to $BACKUP"
  cp "$TARGET" "$BACKUP"
fi

cat <<'EOF' >> "$TARGET"

# Custom Aliases
alias ll='ls -la'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
EOF
