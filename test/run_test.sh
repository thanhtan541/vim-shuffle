#!/usr/bin/env bash

echo 'Running test cases ...'

for f in ./test/tests/*.vim; do
    echo "Test file: $f"
    vim --clean -S ./test/run_test.vim "$f" || exit 1
done
