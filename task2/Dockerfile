FROM python:3.10

# Встановимо змінну середовища
ENV APP_HOME /app

# Встановимо робочу директорію всередині контейнера
WORKDIR $APP_HOME

# Спочатку копіюємо requirements.txt для кешування шару залежностей
COPY requirements.txt .

# Встановимо залежності всередині контейнера
RUN pip install --no-cache-dir -r requirements.txt

# Скопіюємо решту файлів проєкту
COPY . .

# Позначимо порт, на якому працює застосунок
EXPOSE 5000

# Передаємо змінну PORT=5000, щоб main.py слухав саме 5000 порт
ENV PORT=5000

# Запустимо наш застосунок
CMD ["python", "main.py"]