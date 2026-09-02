#!/usr/bin/env bash
set -uo pipefail

# Opción -x: matar el servidor sin cambiar de directorio.
while getopts "x" opt; do
  case $opt in
    x)
      pkill -f "quartz"
      rm -f /tmp/quartz-serve.pid
      exit 0
      ;;
    *)
      echo "Uso: $0 [-x] [args...]" >&2
      exit 1
      ;;
  esac
done
shift $((OPTIND - 1))

# Hacer disponibles node, npm y npx aunque el entorno no tenga el PATH de fnm.
export PATH="/home/willy/.local/share/fnm/node-versions/v22.22.2/installation/bin:$PATH"

# Cambiar al directorio real del script, incluso si se invoca por symlink.
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
cd "$SCRIPT_DIR"

nohup npx quartz build --serve "$@" > /tmp/quartz-serve.log 2>&1 &
echo $! > /tmp/quartz-serve.pid