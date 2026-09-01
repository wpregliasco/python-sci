#!/usr/bin/env bash
set -euo pipefail

# Uso: ./deploy.sh [-l] "mensaje de commit"
# Si no se pasa mensaje, usa uno por defecto con fecha/hora.
# -l: hace push a "lan v5" en lugar del remoto/rama por defecto.

# Cambiar al directorio real del script, incluso si se invoca por symlink.
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
cd "$SCRIPT_DIR"

PUSH="git push"

while getopts "l" opt; do
  case $opt in
    l)
      PUSH="git push lan v5"
      ;;
    *)
      echo "Uso: $0 [-l] [mensaje]" >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

MSG="${1:-Update content ($(date '+%Y-%m-%d %H:%M'))}"

git add .
git commit -m "$MSG"
$PUSH
