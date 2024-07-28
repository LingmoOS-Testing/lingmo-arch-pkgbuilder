#!/bin/bash
set -e
while IFS= read -r target; do
    pushd "$target"
    echo "Processing target: $target"
    makepkg -cfs --noconfirm
    popd
done < pkgs
mkdir -pv outputs

find . -type f -name "*.pkg.tar.zst" -exec mv {} outputs \;
