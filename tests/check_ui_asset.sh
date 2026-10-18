#!/bin/sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
src="$root/components/dc_ui/dc_ui.c"

test -f "$src"

# The SPA must have a real, active .len initializer. R10 accidentally put a
# literal "\n" inside a // comment, which commented out .len and served 0 bytes.
grep -Eq '^[[:space:]]*\.len[[:space:]]*=' "$src"
if grep -Fq '\n        .len' "$src"; then
    echo "embedded UI length is hidden behind a literal backslash-n" >&2
    exit 1
fi

echo "embedded UI asset length invariant passed"
