#!/usr/bin/env bash

cd spec
for filename in ./*; do
  /usr/bin/env bash $filename
  if [[ $? -ne 0 ]]; then
    echo "Spec $filename failed"
    exit 1
  fi
done
