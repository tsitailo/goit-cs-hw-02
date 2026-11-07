#!/bin/bash

# Назва файлу логів
LOG_FILE="website_status.log"

# Список вебсайтів для перевірки
WEBSITES=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Очищення або створення файлу логів перед початком перевірки
> "$LOG_FILE"

# Цикл для обходу всіх сайтів у списку
for url in "${WEBSITES[@]}"; do
    # -s / --silent: приховує вивід прогресу curl
    # -L / --location: слідує за переадресацією (redirects)
    # -o /dev/null: ігнорує тіло відповіді
    # -w "%{http_code}": повертає лише HTTP статус-код
    # --connect-timeout 5: таймаут підключення у секундах
    http_code=$(curl -s -L -o /dev/null -w "%{http_code}" --connect-timeout 5 "$url")

    # Перевіряємо, чи статус-код дорівнює 200
    if [ "$http_code" -eq 200 ]; then
        echo "<$url> is UP" >> "$LOG_FILE"
    else
        echo "<$url> is DOWN" >> "$LOG_FILE"
    fi
done

# Повідомлення про завершення роботи та збереження результатів
echo "Перевірку завершено. Результати записано у файл логів: $LOG_FILE"