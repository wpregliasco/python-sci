#!/usr/bin/env bash
set -uo pipefail

# Cambiar al directorio real del script, incluso si se invoca por symlink.
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
cd "$SCRIPT_DIR"

# Compara dos versiones del tipo "22.16.0". Devuelve 0 si v1 >= v2.
version_ge() {
  awk -v v1="$1" -v v2="$2" 'BEGIN {
    split(v1, a, ".")
    split(v2, b, ".")
    for (i=1; i<=3; i++) {
      a1 = (a[i]=="" ? 0 : a[i])
      b1 = (b[i]=="" ? 0 : b[i])
      if (a1 > b1) exit 0
      if (a1 < b1) exit 1
    }
    exit 0
  }'
}

# node y npx >= 22 son suficientes (npm >= 10 viene con Node 22).
is_node_ok() {
  local node_path node_ver
  node_path=$(command -v node 2>/dev/null) || return 1
  node_ver=$("$node_path" -v 2>/dev/null | sed 's/^v//')
  [ -n "$node_ver" ] && version_ge "$node_ver" "22.0.0"
}

# 1. Intentar con fnm si está disponible (lee .node-version del proyecto).
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env)"
  fnm use >/dev/null 2>&1 || true
fi

# 2. Si aún no es la versión correcta, buscar node en instalaciones fnm.
if ! is_node_ok; then
  FNM_NODE=$(find "$HOME/.local/share/fnm/node-versions" "$HOME/.fnm/node-versions" -maxdepth 5 -name node -type f -executable 2>/dev/null | sort -V | tail -1)
  if [ -n "$FNM_NODE" ]; then
    export PATH="$(dirname "$FNM_NODE"):$PATH"
  fi
fi

# 3. Si aún no sirve, fallar.
if ! is_node_ok; then
  echo "Error: no se encontró Node.js >= 22. Instalá Node.js o fnm." >&2
  exit 1
fi

ACTION="${1:-start}"
if [ "$#" -gt 0 ]; then
  shift
fi

case "$ACTION" in
  start)
    nohup npx quartz build --serve "$@" > /tmp/quartz-serve.log 2>&1 &
    echo $! > /tmp/quartz-serve.pid
    ;;
  stop)
    pkill -f "quartz"
    rm -f /tmp/quartz-serve.pid
    ;;
  *)
    echo "Uso: $0 [start|stop] [args...]" >&2
    exit 1
    ;;
esac
