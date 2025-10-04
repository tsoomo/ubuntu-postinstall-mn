#!/bin/sh
set -eu

echo "[*] Configuring bash history..."

TARGET="/etc/profile.d/bash_history.sh"
BACKUP="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"

if [ -f "$TARGET" ]; then
  echo "[*] Backing up existing $TARGET to $BACKUP"
  sudo cp "$TARGET" "$BACKUP"
fi

cat <<'EOF' | sudo tee "$TARGET" >/dev/null
HISTSIZE=10000
HISTFILESIZE=20000
export HISTTIMEFORMAT="%F %T "
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
EOF
