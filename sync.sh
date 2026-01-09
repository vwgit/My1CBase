#!/bin/bash

# Отключаем автоматическое преобразование путей Git Bash
export MSYS_NO_PATHCONV=1

# Создаем папку для исходников, если её нет
mkdir -p "/d/1C_Projects/MyBase/src"

# Пути (используем прямые слеши, 1С их понимает, если отключен PATHCONV)
BIN="C:/Program Files (x86)/1cv8t/8.3.27.1508/bin/1cv8t.exe"
DB_PATH="C:/Users/User/Documents/InfoBase"
OUT_PATH="D:/1C_Projects/MyBase/src"
LOG_PATH="D:/1C_Projects/MyBase/log_1c.txt"

echo "--- Запуск выгрузки: $(date +'%H:%M:%S') ---"

# Запуск конфигуратора в режиме выгрузки
# Важно: Конфигуратор 1С должен быть закрыт перед запуском скрипта
"$BIN" DESIGNER /F "$DB_PATH" /DumpConfigToFiles "$OUT_PATH" /Out "$LOG_PATH"

# Проверка результата (код возврата 1С)
if [ $? -eq 0 ]; then
    echo "Выгрузка успешно завершена."
    
    echo "Синхронизация с GitHub..."
    git add .
    git commit -m "Update config: $(date +'%d.%m.%Y %H:%M')"
    git push origin main
    
    echo "--- Процесс окончен ---"
else
    echo "Ошибка при выгрузке. Проверьте log_1c.txt"
fi
