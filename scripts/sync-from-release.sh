#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <path-to-release-repo>"
  exit 1
fi

release_repo="$1"
if [[ ! -d "$release_repo/.github" ]]; then
  echo "Release repo .github not found: $release_repo/.github"
  exit 1
fi

find . -mindepth 1 -maxdepth 1 \
  ! -name '.git' \
  ! -name 'README.md' \
  ! -name 'scripts' \
  -exec rm -rf {} +

cp -R "$release_repo/.github/." .

echo "Synced release .github content into copilot repo root from $release_repo"
