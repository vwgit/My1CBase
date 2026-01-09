#!/bin/bash
# Путь к учебной версии 1С из вашего скриншота
BIN="/c/Program Files (x86)/1cv8t/8.3.27.1508/bin/1cv8t.exe"
DB_PATH="C:/Users/User/Documents/InfoBase" # ЗАМЕНИТЕ НА ВАШ ПУТЬ
OUT_PATH="D:/1C_Projects/My1CBase/src"

echo "Выгрузка конфигурации..."
"$BIN" DESIGNER /F "$DB_PATH" /DumpConfigToFiles "$OUT_PATH" /Out "log.txt"

echo "Отправка на GitHub..."
git add .
git commit -m "Автоматический коммит: $(date +'%d.%m.%Y %H:%M')"
git push origin main
