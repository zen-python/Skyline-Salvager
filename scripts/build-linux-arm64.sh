#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${1:-$ROOT/build/linux/arm64}"
PRESET_NAME="Linux arm64"
BIN_NAME="skyline-salvager.arm64"
ARCHIVE_NAME="skyline-salvager-linux-arm64.tar.gz"
CHECKSUM_NAME="${ARCHIVE_NAME}.sha256"

mkdir -p "$OUT_DIR"
rm -f "$OUT_DIR/$BIN_NAME" "$OUT_DIR/$ARCHIVE_NAME" "$OUT_DIR/$CHECKSUM_NAME"

godot --headless --path "$ROOT" --export-release "$PRESET_NAME" "$OUT_DIR/$BIN_NAME"
chmod +x "$OUT_DIR/$BIN_NAME"

tar -C "$OUT_DIR" -czf "$OUT_DIR/$ARCHIVE_NAME" "$BIN_NAME"
sha256sum "$OUT_DIR/$ARCHIVE_NAME" > "$OUT_DIR/$CHECKSUM_NAME"

echo "Built Linux arm64 release artifact:"
echo "  $OUT_DIR/$ARCHIVE_NAME"
echo "Checksum:"
echo "  $OUT_DIR/$CHECKSUM_NAME"
