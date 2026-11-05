#!/bin/bash

CHROMIUM_HOME="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-$0}")" && pwd -P)"

export PATH="${CHROMIUM_HOME}:${PATH}"

for f in /etc/chromium/*; do
	[[ -f "${f}" ]] && source "${f}"
done

chromium_flags=(
	--extra-plugin-dir="/usr/lib64/nsbrowser/plugins"
)

if [[ ${CHROMIUM_FLAGS@a} == *a* ]]; then
	chromium_flags+=( "${CHROMIUM_FLAGS[@]}" )
elif [[ ${CHROMIUM_FLAGS+defined} == defined ]]; then
	chromium_flags+=( ${CHROMIUM_FLAGS} )
fi

chromium_flags+=( "$@" )

# Sanitise std{in,out,err} because they'll be shared with untrusted child
# processes (http://crbug.com/376567).
exec < /dev/null
exec > >(exec cat)
exec 2> >(exec cat >&2)

exec -a "/usr/bin/chromium-browser" "${CHROMIUM_HOME}/chrome" "${chromium_flags[@]}"
