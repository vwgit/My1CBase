#!/bin/bash

# 1. Сначала создаем папку src, если её нет (команда Bash)
mkdir -p /d/1C_Projects/MyBase/src

# 2. Настраиваем пути. 
# Для 1С (Windows-программы) пути должны быть с обратными слэшами или в кавычках.
BIN="C:\Program Files (x86)\1cv8t\8.3.27.1508\bin\1cv8t.exe"
DB_PATH="C:\Users\User\Documents\InfoBase"
OUT_PATH="D:\1C_Projects\MyBase\src"
LOG_PATH="D:\1C_Projects\MyBase\log_1c.txt"

echo "--- Начало: $(date +'%H:%M:%S') ---"

# 3. Запуск выгрузки. 
# ВАЖНО: Мы используем '&' вокруг путей, чтобы 1С точно их распознала.
echo "Выгрузка конфигурации из 1С (пожалуйста, подождите)..."

"$BIN" DESIGNER /F "$DB_PATH" /DumpConfigToFiles "$OUT_PATH" /Out "$LOG_PATH"

# 4. Проверка Git
echo "Синхронизация с GitHub..."
git add .
git commit -m "Update: $(date +'%d.%m.%Y %H:%M')"
git push origin main

echo "--- Готово! Проверьте репозиторий на GitHub. ---"
