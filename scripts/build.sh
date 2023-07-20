#!/bin/bash

set -e

BASE=$(cd "$(dirname "$0")";pwd)
ROOT="${BASE}/.."
BUILD="${ROOT}/build/gen"

rm -rf "${BUILD}"
mkdir -p "${BUILD}/rust"
mkdir -p "${BUILD}/java"

protoc -Iprotos \
    --rust_out=experimental-codegen=enabled,kernel=upb:"${BUILD}/rust" \
    --java_out="${BUILD}/java" \
    $(find protos -iname "*.proto")
