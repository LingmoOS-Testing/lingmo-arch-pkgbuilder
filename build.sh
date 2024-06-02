#!/bin/bash
while IFS= read -r target; do
    cd "$target"
    sourceURL=$(head -n 1 sourceURL)
    curl -Lko "$target.tar.gz" "$sourceURL"
    echo "Processing target: $target"
    makepkg -cfs --noconfirm
    cd ..
done < pkgs