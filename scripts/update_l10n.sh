#!/bin/bash

# For each package uses localization, run code generation
for dir in apps/* packages/*; do
  if [ -f "$dir/l10n.yaml" ]; then
    pushd $dir || exit
   flutter gen-l10n
    popd || exit
  fi
done