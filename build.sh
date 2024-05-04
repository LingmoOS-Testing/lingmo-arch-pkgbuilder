#!/bin/bash
while IFS= read -r target; do
    cd "$target"
    echo "Processing target: $target"
    makepkg -cfs --noconfirm
    cd ..
done < pkgs