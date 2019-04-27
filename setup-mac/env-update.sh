#!/bin/bash

dir="$(dirname "$0")"

# If FORCE environment variable is set run full setup
if [[ "$@" == "--force" ]]; then
    echo "Run full setup."
    "$dir/pre-setup.sh"
    "$dir/install-java.sh"
    "$dir/install-android-sdk.sh"
    "$dir/install-android-haxm.sh"
    "$dir/install-node.sh"
fi
echo "Update existing environment."
"$dir/update-android-sdk.sh"
"$dir/update-android-emulators-download.sh"
"$dir/update-android-emulators-create.sh"