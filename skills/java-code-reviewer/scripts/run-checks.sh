#!/usr/bin/env sh
set -eu

ROOT="${1:-.}"

if [ ! -d "$ROOT" ]; then
  echo "project directory not found: $ROOT" >&2
  exit 2
fi

echo "== Java files =="
find "$ROOT" -type f -name '*.java' | sort

echo
echo "== Broad exception catches =="
grep -RInE 'catch[[:space:]]*\([[:space:]]*(Exception|Throwable)[[:space:]]+[A-Za-z_][A-Za-z0-9_]*[[:space:]]*\)' "$ROOT" --include='*.java' || true

echo
echo "== TODO / FIXME =="
grep -RInE 'TODO|FIXME' "$ROOT" --include='*.java' || true

echo
echo "== System.out / printStackTrace =="
grep -RInE 'System\.out\.|printStackTrace\(' "$ROOT" --include='*.java' || true
