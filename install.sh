#!/bin/bash
# Install the Omarchy satellite theme and its live wallpaper refresher.
# Usage: ./install.sh [--no-apply]
set -euo pipefail
cd "$(dirname "$0")"

for dep in curl jq magick systemctl omarchy-theme-set; do
  command -v "$dep" >/dev/null || { echo "missing dependency: $dep" >&2; exit 1; }
done

THEME_DIR="$HOME/.config/omarchy/themes/satellite"
BIN="$HOME/.local/bin"
UNITS="$HOME/.config/systemd/user"
HOOKS="$HOME/.config/omarchy/hooks/theme-set.d"
CONF="$HOME/.config/omarchy/satellite-bg.conf"
mkdir -p "$THEME_DIR" "$BIN" "$UNITS" "$HOOKS"

install -m 644 colors.toml icons.theme "$THEME_DIR/"
install -m 755 bin/omarchy-satellite-bg bin/omarchy-satellite-palette "$BIN/"
install -m 644 systemd/omarchy-satellite-bg.service systemd/omarchy-satellite-bg.timer "$UNITS/"
install -m 755 hooks/satellite-bg-hook "$HOOKS/satellite-bg-hook"
[[ -f $CONF ]] || install -m 644 satellite-bg.conf.example "$CONF"

systemctl --user daemon-reload
systemctl --user enable --now omarchy-satellite-bg.timer

echo "Fetching the first frame..."
"$BIN/omarchy-satellite-bg" --force

if [[ ${1:-} != --no-apply ]]; then
  omarchy-theme-set satellite
fi

cat <<MSG

Installed. The wallpaper refreshes every 10 minutes while the "Satellite" theme is active.
  config:   $CONF   (center point, zoom, source image)
  refresh:  omarchy-satellite-bg --force
  palette:  omarchy-satellite-palette --apply && omarchy theme set satellite   (needs node)
MSG
