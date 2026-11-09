#!/bin/bash

set -euo pipefail

if (( $# < 1 )); then
	echo "usage: $0 plan.json" >&2
	exit 1
fi

packages=(
	$(jq -r '.["install-plan"][] | select(.["pkg-src"].type == "repo-tar") | "\(.["pkg-name"])-\(.["pkg-version"])"' "$1" | sort -u)
)

mkdir -p vendor

for package in "${packages[@]}"; do
	revision="$(curl -fsSL -H "Accept: application/json" "https://hackage.haskell.org/package/${package}/revisions/" | jq 'max_by(.number).number')"
	echo "https://hackage.haskell.org/package/${package}/${package}.tar.gz"
	echo "https://hackage.haskell.org/package/${package}/revision/${revision}.cabal -> ${package}.cabal"
done
