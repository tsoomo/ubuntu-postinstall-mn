#!/bin/sh
set -eu

# Base URL of this repo (replace with your GitHub username)
REPO_URL="https://raw.githubusercontent.com/tsoommo/ubuntu-postinstall-mn/main/scripts"

echo "[*] Running post-install scripts..."

for script in timezone.sh history.sh vimrc.sh motd.sh aliases.sh env.sh; do
  echo "[*] Executing $script..."
  curl -fsSL "$REPO_URL/$script" | sh
done

echo "[*] All post-install tasks completed."
