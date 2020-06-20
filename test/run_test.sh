#!/usr/bin/env bash

echo 'Running test cases ...'

LOG_TEST_DIR='./test/logs/'
if [ ! -d "$LOG_TEST_DIR" ]; then
    echo "Creating logs folder"
    mkdir -p $LOG_TEST_DIR
fi

for f in ./test/tests/*.vim; do
    echo "Test file: $f"
    vim --clean -S ./test/run_test.vim "$f" || exit 1
done
