#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

write_location() {
  local name="$1"
  local description="$2"
  local output_file="$3"
  shift 3
  local -a files=("$@")

  {
    echo 'apiVersion: backstage.io/v1alpha1'
    echo 'kind: Location'
    echo 'metadata:'
    echo "  name: $name"
    echo "  description: $description"
    echo 'spec:'
    echo '  type: url'

    if [ "${#files[@]}" -eq 0 ]; then
      echo '  targets: []'
    else
      echo '  targets:'
      for file in "${files[@]}"; do
        echo "    - ./$file"
      done
    fi
  } > "$output_file"
}

mapfile -t template_files < <(find templates -mindepth 2 -maxdepth 2 -type f -name 'template.yaml' -printf '%P\n' | LC_ALL=C sort)
mapfile -t catalog_files < <(find catalog -type f -name '*.yaml' ! -path 'catalog/index.yaml' -printf '%P\n' | LC_ALL=C sort)

write_location "template-library" "All Backstage templates" "templates/index.yaml" "${template_files[@]}"
write_location "homelab-catalog" "Homelab catalog entities" "catalog/index.yaml" "${catalog_files[@]}"
