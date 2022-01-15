#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

REPO_BASE=$( cd "$SCRIPT_DIR/.." && pwd )
REPO_CODENAME=stable

echo "Removing any exising packages"
rm -f "$REPO_BASE"/*.deb

echo "Downloading latest release"
tag_name=$( gh release view -R reubenmiller/go-c8y-cli --json tagName --jq ".tagName" )
"$SCRIPT_DIR/download.sh"

reprepro -V --basedir "$REPO_BASE" --component main includedeb $REPO_CODENAME "$REPO_BASE"/incoming/*.deb

if ! git diff-index --quiet HEAD --; then
    echo "Commit changes"
    git add --all
    git commit -m "Publishing new release: $tag_name"
    git push
fi
