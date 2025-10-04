#!/bin/sh
set -eu

TARGET="/etc/profile.d/custom_env.sh"
BACKUP="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"

echo "[*] Setting environment defaults..."

if [ -f "$TARGET" ]; then
  echo "[*] Backing up existing $TARGET to $BACKUP"
  sudo cp "$TARGET" "$BACKUP"
fi

cat <<'EOF' | sudo tee "$TARGET" >/dev/null
export EDITOR=vim
export LC_ALL=en_US.UTF-8
EOF
