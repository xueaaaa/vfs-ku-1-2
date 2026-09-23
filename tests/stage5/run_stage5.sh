#!/bin/sh
# Этап 5: rm и chown, изменяющие состояние VFS в памяти.
set -e

go build -o vfs-shell .

echo "=== rm/chown на VFS с несколькими файлами ==="
./vfs-shell --vfs=tests/stage3/vfs_multiple.xml --script=tests/stage5/script_rm_chown.txt &
sleep 3 && kill $! 2>/dev/null

echo "Готово. Проверь, что rm реально убирает файлы из последующего ls,"
echo "а chown меняет владельца (если у тебя есть вывод владельца в ls -l или отдельной командой)."
