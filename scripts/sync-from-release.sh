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

rm -rf .github
mkdir -p .github
cp -R "$release_repo/.github/." .github/

echo "Synced .github from $release_repo"
