#!/bin/bash

REPO=reubenmiller/go-c8y-cli

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
gh release download -R $REPO --pattern "*.deb" --dir "$SCRIPT_DIR/../incoming"

# Remove incompatible arch type
rm -f "$SCRIPT_DIR/../incoming/"*armv7*.deb
