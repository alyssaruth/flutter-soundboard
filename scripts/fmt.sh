#!/usr/bin/env bash
scriptDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd $scriptDir/..
dart format --line-length 120 .