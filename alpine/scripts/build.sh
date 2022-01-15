#!/bin/bash
#
# https://www.linkedin.com/pulse/creating-alpine-linux-package-repository-afam-agbodike
# https://www.erianna.com/creating-a-alpine-linux-repository/
#

REPO=reubenmiller/go-c8y-cli

SIGN_KEY=${1:-alpine-devel@example.com-5629d7e6.rsa}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
REPO_BASE=$( cd "$SCRIPT_DIR/.." && pwd )

echo "Installing dependencies"
apk add gcc abuild --no-cache

INCOMING="$SCRIPT_DIR/incoming"
rm -Rf "$INCOMING"

gh release download -R $REPO --pattern "*.apk" --dir "$INCOMING"

function index_packages () {
    filter=$1
    arch=$2
    CURRENT_BASE="$REPO_BASE/stable/main/$arch"

    mkdir -p "$CURRENT_BASE"
    cp "$INCOMING"/*"$filter"*.apk "$CURRENT_BASE/"

    apk index -o "$CURRENT_BASE/APKINDEX.unsigned.tar.gz" "$CURRENT_BASE"/*.apk
    cp "$CURRENT_BASE/APKINDEX.unsigned.tar.gz" "$CURRENT_BASE/APKINDEX.tar.gz"

    abuild-sign -k "$SIGN_KEY" /repo/x86_64/APKINDEX.tar.gz
}

index_packages "amd64" "x86_64"
index_packages "armv7" "armv7"
index_packages "386" "x86"


# stable main 
# c8y-alpine/stable/main/x86_64/go-c8y-cli-2.4.5.apk
# c8y-alpine/stable/main/armv7/go-c8y-cli-2.4.5.apk
# c8y-alpine/stable/main/x86/go-c8y-cli-2.4.5.apk
