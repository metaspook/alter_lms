#!/bin/bash
# Get workspace dependencies
flutter pub get

# For each package that uses build_runner, run code generation
for dir in ../apps/* ../packages/*; do
  if [ -f "$dir/pubspec.yaml" ]; then
    if grep -q build_runner "$dir/pubspec.yaml"; then
      pushd $dir || exit
      dart run build_runner build --delete-conflicting-outputs
      popd || exit
    fi
  fi
done