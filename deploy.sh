#!/usr/bin/env bash
set -euo pipefail
 
# Uso: ./deploy.sh "mensaje de commit"
# Si no se pasa mensaje, usa uno por defecto con fecha/hora.
 
MSG="${1:-Update content ($(date '+%Y-%m-%d %H:%M'))}"
 
git add content/
git commit -m "$MSG"
git push origin main
