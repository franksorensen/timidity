#!/bin/sh
# Compile the libtimidity C codebase to JavaScript with emscripten
set -e

BUILD_FLAGS="-s STRICT=1 -s ALLOW_MEMORY_GROWTH=1"
EXPORT_FLAGS="-s MODULARIZE=1 -s EXPORT_NAME=LibTimidity -s EXPORTED_FUNCTIONS=@exports.json -s EXTRA_EXPORTED_RUNTIME_METHODS=@exports-runtime.json"

OPTIMIZE_FLAGS="-Oz -s ENVIRONMENT=web" # PRODUCTION
# OPTIMIZE_FLAGS="-g4 -DTIMIDITY_DEBUG" # DEBUG

emcc -o libtimidity.js $OPTIMIZE_FLAGS $BUILD_FLAGS $EXPORT_FLAGS libtimidity/src/*.c
