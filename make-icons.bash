#!/usr/bin/env bash
#
# make-icons.bash - regenerate icon.icns and icon.ico from icon.png.
#
# Run this on macOS or Linux whenever icon.png is updated, then commit all
# three files together. Delegates to make_icons.py (Pillow), so the output
# is identical to running make-icons.ps1 on Windows.
#
# Usage:
#   ./make-icons.bash [path/to/icon.png]

set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "Not inside a git repository." >&2; exit 1; }
cd "$ROOT"

PY="$(command -v python3 || command -v python || true)"
[ -n "$PY" ] || { echo "Error: python3 not found on PATH." >&2; exit 1; }

if ! "$PY" -c "import PIL" >/dev/null 2>&1; then
    echo "Pillow not found - installing (pip install --user Pillow)..."
    "$PY" -m pip install --quiet --user Pillow
fi

"$PY" "$ROOT/make_icons.py" "$@"
