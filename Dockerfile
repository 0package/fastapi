# Cloudtype에서 사용할 Python 버전
FROM python:3.9

# 필수 빌드 도구와 라이브러리 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    libdbus-1-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# requirements 필요 패키지 설치
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

