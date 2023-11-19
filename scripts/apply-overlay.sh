#!/bin/bash

# Include hidden directories
shopt -s dotglob

src="${1:-$LGSM_HELPER_OVERLAY_SRC}"
dest="${2:-$LGSM_HELPER_OVERLAY_DEST}"

echo "Applying overlays from: $src"
echo "to: $dest"
echo ""

for dir in $src/*/     # list directories in the form "/tmp/dirname/"
do
    dir=${dir%*/}      # remove the trailing "/"
    echo "Applying $dir overlay"
    cp --verbose -rp "$dir"/* "$dest"

done


echo "Done applying overlays"