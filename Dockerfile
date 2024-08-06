FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt update -y && \
    apt install -y python3-dev \
    gcc \
    musl-dev \
    libpq-dev \
    nmap

ADD pyproject.toml /app/

RUN pip install --upgrade pip
RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-root --no-interaction --no-ansi

COPY . /app/

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
