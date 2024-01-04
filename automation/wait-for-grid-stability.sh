#!/bin/bash

set -e

ATTEMPTS=1
MAX_ATTEMPTS=10
DEBUG=false

function display_attempts {
  if $DEBUG; then echo "Attempts made: ${ATTEMPTS}. Will re-attempt $((MAX_ATTEMPTS - ATTEMPTS)) more times."; fi
}

function check_for_max_attempts_exhausted {
  if [ "$ATTEMPTS" -gt "$MAX_ATTEMPTS" ]; then
      echo "Failed to instantiate grid within ${MAX_ATTEMPTS} attempts" && exit 1
  fi
}

if $DEBUG; then set -x; fi

while ! curl -sSL 'http://hub:4444/wd/hub/status' 2>&1 | jq -r '.value.ready' 2>&1 | grep 'true' >/dev/null; do
    check_for_max_attempts_exhausted
    echo 'GRID STATUS: NOT READY'
    display_attempts
    ((ATTEMPTS = ATTEMPTS + 1))
    sleep 2
done

while ! curl -sSL 'http://hub:4444/wd/hub/status' 2>&1 | jq '.value.nodes | length == 2' >/dev/null; do
    check_for_max_attempts_exhausted
    echo 'GRID STATUS: READY. NODE STATUSES: NOT READY.'
    display_attempts
    ((ATTEMPTS = ATTEMPTS + 1))
    sleep 1
done

echo 'GRID STATUS: READY. NODE STATUSES: 2 ACTIVE NODES.'
echo 'App is NOT being launched asynchronously - In the future we can wait for it using `wait-for.sh`.'

