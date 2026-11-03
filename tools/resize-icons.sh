#!/usr/bin/env bash
set -euo pipefail
SRC=${1:-assets-src/hyperion-1024.png}
OUT=Assets
mkdir -p "$OUT"

emit() {
  local name=$1 w=$2 h=$3 s tw th
  for s in 100 125 150 200 400; do
    tw=$(( w * s / 100 ))
    th=$(( h * s / 100 ))
    magick "$SRC" -background none -resize "${tw}x${th}" \
      -gravity center -extent "${tw}x${th}" \
      "$OUT/$name.scale-$s.png"
  done
}

emit Square44x44Logo   44 44
emit Square150x150Logo 150 150
emit Wide310x150Logo   310 150
emit LargeTile         310 310
emit SmallTile         71 71
emit SplashScreen      620 300
emit StoreLogo         50 50
emit LockScreenLogo    24 24

for n in 16 24 32 48 256; do
  magick "$SRC" -background none -resize "${n}x${n}" \
    -gravity center -extent "${n}x${n}" \
    "$OUT/Square44x44Logo.targetsize-$n.png"
done

magick "$SRC" -background none -define icon:auto-resize=256,128,64,48,32,24,16 \
  "$OUT/WindowIcon.ico"

echo "icons regenerated"
