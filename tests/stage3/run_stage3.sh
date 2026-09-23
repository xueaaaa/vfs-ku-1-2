#!/bin/sh
set -e

go build -o vfs-shell ./

./vfs-shell --vfs=tests/stage3/vfs_minimal.xml --script=tests/stage3/script_minimal.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --vfs=tests/stage3/vfs_multiple.xml &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --vfs=tests/stage3/vfs_nested.xml --script=tests/stage3/script_nested.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --vfs=tests/stage3/vfs_nested.xml --script=tests/stage3/script_errors.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --vfs=tests/stage3/vfs_invalid.xml &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --vfs=tests/stage3/nonexistent.xml &
sleep 20 && kill $! 2>/dev/null