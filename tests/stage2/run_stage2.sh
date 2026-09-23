#!/bin/sh
set -e

go build -o vfs-shell ./

./vfs-shell &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --script=tests/stage2/script_basic.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --script=tests/stage2/script_comments.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --script=tests/stage2/script_errors.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --script=tests/stage2/script_empty.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --script=tests/stage2/nonexistent.txt &
sleep 20 && kill $! 2>/dev/null

./vfs-shell --vfs=tests/stage3/vfs_minimal.xml &
sleep 20 && kill $! 2>/dev/null