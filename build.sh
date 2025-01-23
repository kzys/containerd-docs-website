#! /bin/bash
set -euo pipefail

if [[ ! -d containerd ]]; then
    git clone --depth 1 --no-single-branch https://github.com/containerd/containerd
fi

pushd containerd
git checkout release/2.0
cp -r docs/* ../content/en/docs/
popd

ruby add-front-matter.rb content/en/docs/*.md

npm run "$1"
