#!/usr/bin/env bash
set -euo pipefail

# Cambiar al directorio real del script, incluso si se invoca por symlink.
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
cd "$SCRIPT_DIR"

npx quartz build --serve "$@"
