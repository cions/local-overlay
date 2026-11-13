#!/bin/bash

set -euo pipefail

if (( $# < 1 )); then
	echo "usage: $0 plan.json" >&2
	exit 1
fi

: ${HACKAGE_URL:=https://hackage.haskell.org}

packages=(
	$(jq -r '.["install-plan"][] | select(.["pkg-src"].type == "repo-tar") | "\(.["pkg-name"])-\(.["pkg-version"])"' "$1" | sort -u)
)

for package in "${packages[@]}"; do
	revision="$(curl -fsSL -H "Accept: application/json" "${HACKAGE_URL}/package/${package}/revisions/" | jq 'max_by(.number).number')"
	echo "${package}@${revision}"
done
