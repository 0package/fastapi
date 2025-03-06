# Cloudtype에서 사용할 Python 버전
FROM python:3.9

WORKDIR /app

COPY requirements.txt .

# requirements 필요 패키지 설치
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

