FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends tzdata && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /app/app_data && chmod -R 777 /app/app_data

ENV PORT=7860
ENV DATA_DIR=/app/app_data

EXPOSE 7860

CMD ["python", "main.py"]
