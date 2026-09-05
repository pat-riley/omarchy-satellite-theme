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

# GTK apps (Files, dialogs) follow the theme through a rendered gtk.css. This is a user
# template, so it applies to every Omarchy theme, not just this one.
mkdir -p "$HOME/.config/omarchy/themed" "$HOME/.config/gtk-4.0" "$HOME/.config/gtk-3.0"
install -m 644 gtk/gtk.css.tpl "$HOME/.config/omarchy/themed/gtk.css.tpl"
GTK_IMPORT='@import url("file://'"$HOME"'/.local/state/omarchy/current/theme/gtk.css");'
for v in gtk-4.0 gtk-3.0; do
  f="$HOME/.config/$v/gtk.css"
  if [[ -f $f ]]; then
    grep -qF "$GTK_IMPORT" "$f" || { printf '%s\n' "$GTK_IMPORT" | cat - "$f" > "$f.new" && mv "$f.new" "$f"; }
  else
    printf '%s\n' "$GTK_IMPORT" > "$f"
  fi
done
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
