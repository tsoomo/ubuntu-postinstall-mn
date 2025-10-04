#!/bin/sh
set -eu

echo "[*] Setting custom MOTD..."

TARGET="/etc/update-motd.d/00-custom"
BACKUP="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"

# Backup existing custom MOTD if it exists
if [ -f "$TARGET" ]; then
  echo "[*] Backing up existing MOTD to $BACKUP"
  sudo cp "$TARGET" "$BACKUP"
fi

# Disable default MOTD scripts
sudo chmod -x /etc/update-motd.d/* || true

# Write new custom MOTD
cat <<'EOF' | sudo tee "$TARGET" >/dev/null
#!/bin/sh
echo "====================================="
echo " Welcome to your Ubuntu 24.04 system "
echo " $(lsb_release -ds) - $(uname -r)"
echo " Hostname: $(hostname)"
echo " Date:     $(date)"
echo "====================================="
EOF

sudo chmod +x "$TARGET"
