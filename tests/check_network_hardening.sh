#!/bin/sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
wifi="$root/components/dc_wifi/dc_wifi.c"
hdr="$root/components/dc_wifi/include/dc_wifi.h"
app="$root/main/app_main.c"
manifest="$root/main/idf_component.yml"

test -f "$wifi"
test -f "$hdr"

grep -q 'RUNTIME_RETRY_DELAY_US' "$wifi"
grep -q 'runtime_reconnect_schedule' "$wifi"
grep -q 's_startup_complete' "$wifi"
grep -q 'WIFI_PS_NONE' "$wifi"
grep -q 'DC_WIFI_AP_MODE_DEFAULT DC_WIFI_AP_FALLBACK' "$hdr"

# DragonBreath must not start the optional ESP-NOW broadcaster in R10.
if grep -q 'pb_peer_start()' "$app"; then
    echo "ESP-NOW peer broadcaster was re-enabled in app_main" >&2
    exit 1
fi

# The patched Wi-Fi component must be local, not silently replaced by managed core.
if grep -A3 '^  dc_wifi:' "$manifest" | grep -q 'dragon-core'; then
    echo "dc_wifi is managed again; R10 hardening would be lost" >&2
    exit 1
fi

echo "network hardening checks passed"
