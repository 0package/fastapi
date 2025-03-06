# 1. 베이스 이미지로 Python 3.9을 사용
FROM arm32v7/python:3.9-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 시스템 패키지 업데이트 및 필수 라이브러리 설치
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    libjpeg-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsndfile1 \
    libjpeg8-dev \
    liblcms2-dev \
    libblas-dev \
    liblapack-dev \
    libcario2 \
    libcario2-dev \
    pkg-config \
    meson \
    gfortran \
    && rm -rf /var/lib/apt/lists/*

# 4. requirements.txt 파일을 컨테이너에 복사
COPY requirements.txt .

# 5. Python 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 6. 컨테이너 실행 시 기본 명령어 설정 (예: FastAPI 앱 실행)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

