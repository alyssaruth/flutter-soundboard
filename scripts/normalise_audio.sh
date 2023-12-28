#!/usr/bin/env bash
scriptDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd $scriptDir/../assets
FILES=$(ls | grep .wav)
normalize-audio $FILES
cd -
