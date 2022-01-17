#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

INCOMING="${1:-$SCRIPT_DIR/../incoming}"

REPO_BASE=$( cd "$SCRIPT_DIR/.." && pwd )
REPO_CODENAME=stable

if ! command -v reprepro; then
    sudo apt-get update
    sudo apt-get install -y reprepro
fi

if [ -d "$REPO_BASE" ]; then
    echo "Removing existing packages"
    reprepro --basedir "$REPO_BASE" --component main removematched $REPO_CODENAME "*"
fi

reprepro -V --basedir "$REPO_BASE" --component main includedeb $REPO_CODENAME "$INCOMING/"*.deb
