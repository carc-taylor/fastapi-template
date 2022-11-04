FROM python:3.10-slim-bullseye

WORKDIR /usr/app

COPY pyproject.toml .
COPY poetry.lock .

RUN pip install --upgrade pip && pip install poetry

RUN python -m venv .venv && poetry install --no-root --no-dev

COPY . .

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 5000

ENV UVICORN_PORT 5000

ENTRYPOINT ["sh" ,"/docker-entrypoint.sh" ]