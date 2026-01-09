#!/bin/bash

# Пути к программам и папкам
BIN="C:/Program Files (x86)/1cv8t/8.3.27.1508/bin/1cv8t.exe"
DB_PATH="C:/Users/User/Documents/InfoBase"
OUT_PATH="D:/1C_Projects/MyBase/src"

echo "--- Начало процесса: $(date +'%H:%M:%S') ---"

# 1. Выгрузка конфигурации в XML-файлы
echo "Выгрузка конфигурации из 1С..."
"$BIN" DESIGNER /F "$DB_PATH" /DumpConfigToFiles "$OUT_PATH" /Out "log_1c.txt"

# 2. Отправка изменений в Git
echo "Синхронизация с GitHub..."
git add .
git commit -m "Update: $(date +'%d.%m.%Y %H:%M')"
git push origin main

echo "--- Готово ---"
