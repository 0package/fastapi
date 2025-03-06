FROM python:3.11

# 작업 디렉토리 설정
WORKDIR /app

#ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
# 필수 패키지 설치
RUN apt-get update && \
    apt-get install -y gcc libffi-dev libpq-dev libdbus-1-dev \
    libglib2.0-dev libcairo2 libcairo2-dev libcairo-gobject2 pkg-config \
    gir1.2-gtk-3.0 python3-gi python3-gi-cairo python3-dev \
    libsmbclient libsmbclient-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# requirements.txt 복사 및 종속성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 애플리케이션 코드 복사
COPY . .

# FastAPI 실행 (uvicorn 사용)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
