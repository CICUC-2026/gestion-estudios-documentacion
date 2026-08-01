#!/usr/bin/env bash
set -euo pipefail

raiz="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
directorio_hu="$raiz/historias-usuario"

for dependencia in rg gh jq; do
  command -v "$dependencia" >/dev/null || { echo "Falta la dependencia: $dependencia" >&2; exit 2; }
done

archivo_project="$(mktemp)"
trap 'rm -f "$archivo_project"' EXIT
gh project item-list 1 --owner CICUC-2026 --format json --limit 200 >"$archivo_project"

errores=0
declare -A issue_a_hu=()

while IFS= read -r archivo; do
  hu="$(basename "$archivo" .md | cut -d- -f1-2)"
  issue_url="$(rg -o 'https://github\.com/CICUC-2026/gestion-estudios-documentacion/issues/[0-9]+' "$archivo" | head -n1 || true)"
  if [[ -z "$issue_url" ]]; then
    echo "ERROR $hu: falta URL de issue"
    errores=$((errores + 1))
    continue
  fi
  if [[ -n "${issue_a_hu[$issue_url]:-}" ]]; then
    echo "ERROR $hu: $issue_url también está referenciado por ${issue_a_hu[$issue_url]}"
    errores=$((errores + 1))
  else
    issue_a_hu[$issue_url]="$hu"
  fi
  if ! jq -e --arg url "$issue_url" '.items[] | select(.content.url == $url)' "$archivo_project" >/dev/null; then
    echo "ERROR $hu: el issue no está en Project 1"
    errores=$((errores + 1))
  fi
done < <(find "$directorio_hu" -type f -name 'HU-*.md' -print | sort)

if (( errores > 0 )); then
  echo "Validación terminada con $errores error(es)." >&2
  exit 1
fi
echo "Trazabilidad válida: Markdown, issues únicos y membresía en Project 1."
