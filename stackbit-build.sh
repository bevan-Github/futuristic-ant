#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e16e8cdb8c20a001afad0b9/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e16e8cdb8c20a001afad0b9
curl -s -X POST https://api.stackbit.com/project/5e16e8cdb8c20a001afad0b9/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e16e8cdb8c20a001afad0b9/webhook/build/publish > /dev/null
