#!#!/usr/bin/env bash

set -x
set -e

rm -rf ./tmp-dart-config
git clone https://github.com/ophiradi/CodeSamples.git tmp-dart-config
pushd ./tmp-dart-config
  current_version=$(bumpversion patch --config-file .bumversion.cfg --list| tail -1 | awk -F'=' '{print $2}')
  sed -i.old "s|dart-flask:.*\'|dart-flask:${current_version}\'|g" dart-template-partial.yaml
  git push
popd
rm -rf ./tmp-dart-config


