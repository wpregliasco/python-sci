#!/usr/bin/env bash
# Autohospeda KaTeX, Mermaid y Google Fonts para que el sitio funcione sin WAN.
# Correr después de cualquier `npm install`.
set -e

KATEX_TARGET="node_modules/@quartz-community/latex/dist/index.js"
KATEX_STATIC="quartz/static/katex"

MERMAID_TARGET="node_modules/@quartz-community/obsidian-flavored-markdown/dist/index.js"
MERMAID_STATIC="quartz/static/mermaid"

FONTS_TARGET="node_modules/@quartz-community/quartz-fonts/dist/index.js"

check_and_patch () {
  local target="$1" asset_dir="$2" asset_file="$3" old_url="$4" new_path="$5"
  if [ ! -f "$target" ]; then
    echo "No encontré $target — ¿corriste npm install?"; return 1
  fi
  if [ -n "$asset_dir" ] && [ ! -f "$asset_dir/$asset_file" ]; then
    echo "No encontré $asset_dir/$asset_file — ¿se borró la carpeta static?"; return 1
  fi
  sed -i "s#$old_url#$new_path#" "$target"
}

check_and_patch "$KATEX_TARGET" "$KATEX_STATIC" "katex.min.css" \
  "https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/katex.min.css" \
  "/static/katex/katex.min.css"

check_and_patch "$KATEX_TARGET" "$KATEX_STATIC" "copy-tex.min.js" \
  "https://cdn.jsdelivr.net/npm/katex@0.16.11/dist/contrib/copy-tex.min.js" \
  "/static/katex/copy-tex.min.js"

check_and_patch "$MERMAID_TARGET" "$MERMAID_STATIC" "mermaid.esm.min.mjs" \
  "https://cdnjs.cloudflare.com/ajax/libs/mermaid/11.4.0/mermaid.esm.min.mjs" \
  "/static/mermaid/mermaid.esm.min.mjs"

# Bug del plugin quartz-fonts: arma la URL de fonts como https://${baseUrl}/... en vez de relativa
check_and_patch "$FONTS_TARGET" "" "" \
  '`https://\${baseUrl}/static/fonts/\${filename}.\${extension}`' \
  '`/static/fonts/${filename}.${extension}`'

if grep -rq "jsdelivr\|cdnjs.cloudflare" "$KATEX_TARGET" "$MERMAID_TARGET" 2>/dev/null; then
  echo "Ojo: todavía queda alguna referencia externa en KaTeX/Mermaid."
else
  echo "OK: KaTeX y Mermaid autohospedados."
fi