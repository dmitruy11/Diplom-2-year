FROM python:3.9

# Установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY lightfm_model.pickle .
COPY lightfm_data_mapping.pickle .
# Копирование кода приложения
COPY . .

# Установка переменной окружения для Flask
ENV FLASK_APP=app.py

# Запуск вашего приложения
CMD [ "flask", "run", "--host", "0.0.0.0", "--port", "8888" ]