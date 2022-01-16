#!/bin/bash

if [[ -z "$GPG_PRIVATE_KEY" ]]; then
    echo "Missing env variable: GPG_PRIVATE_KEY"
    exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_BASE=$( cd "$SCRIPT_DIR/.." && pwd )

docker build -t "rpm" -f "$SCRIPT_DIR/centos.dockerfile" "$SCRIPT_DIR"
docker run \
    --rm \
    -it \
    -v "$REPO_BASE:/repo" \
    --env "GPG_PRIVATE_KEY=$GPG_PRIVATE_KEY" \
    rpm /repo/scripts/build-rpm.sh
