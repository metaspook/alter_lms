#!/bin/bash
# Clean the main Flutter project
flutter clean

# Clean each app and package
for dir in apps/* packages/*; do
  if [ -f "$dir/pubspec.yaml" ]; then
    pushd $dir || exit
    flutter clean
    popd || exit
  fi
done