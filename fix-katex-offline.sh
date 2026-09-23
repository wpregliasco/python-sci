#!/usr/bin/env bash
# Autohospeda KaTeX (CSS + copy-tex.js) para que el sitio funcione sin WAN.
# Correr después de cualquier `npm install` que pise node_modules/@quartz-community/latex.
set -e

TARGET="node_modules/@quartz-community/latex/dist/index.js"
STATIC_DIR="quartz/static/katex"

if [ ! -f "$TARGET" ]; then
  echo "No encontré $TARGET — ¿corriste npm install?"
  exit 1
fi

if [ ! -f "$STATIC_DIR/katex.min.css" ]; then
  echo "No encontré $STATIC_DIR/katex.min.css — ¿se borró la carpeta static/katex?"
  exit 1
fi

sed -i \
  -e 's#https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css#/static/katex/katex.min.css#' \
  -e 's#https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/copy-tex.min.js#/static/katex/copy-tex.min.js#' \
  "$TARGET"

if grep -q "jsdelivr" "$TARGET"; then
  echo "Ojo: todavía queda alguna referencia a jsdelivr en $TARGET (revisar a mano, puede que haya cambiado la versión de katex)."
else
  echo "OK: $TARGET ya no depende de jsdelivr."
fi