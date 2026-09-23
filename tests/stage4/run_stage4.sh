#!/bin/sh
# Этап 4: полноценные ls/cd + команды rev и clear.
# Использует ту же вложенную VFS, что и этап 3.
set -e

go build -o vfs-shell .

echo "=== Полный прогон ls/cd/rev/clear на вложенной VFS ==="
./vfs-shell --vfs=tests/stage3/vfs_nested.xml --script=tests/stage4/script_full.txt &
sleep 3 && kill $! 2>/dev/null

echo "Готово. Проверь вывод окна вручную."
