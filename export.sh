# Путь к платформе 1С
BIN="/c/Program Files/1cv8/8.3.22.1709/bin/1cv8.exe"
# Путь к вашей базе
DB_PATH="C:/1C_Projects/My1CBase"
# Папка для выгрузки кода
OUT_PATH="C:/1C_Projects/My1CBase/src"

echo "Начало выгрузки конфигурации в файлы..."
"$BIN" DESIGNER /F "$DB_PATH" /DumpConfigToFiles "$OUT_PATH" /Out "log.txt"
echo "Выгрузка завершена. Проверьте log.txt в случае ошибок."
