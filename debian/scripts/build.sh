#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

INCOMING="${1:-$SCRIPT_DIR/../incoming}"

REPO_BASE=$( cd "$SCRIPT_DIR/.." && pwd )
REPO_CODENAME=stable

if ! command -v reprepro; then
    sudo apt-get update
    sudo apt-get install -y reprepro
fi

echo "Removing any exising packages"
rm -f "$REPO_BASE"/*.deb

reprepro -V --basedir "$REPO_BASE" --component main includedeb $REPO_CODENAME "$INCOMING/"*.deb
