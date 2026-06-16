FROM python:3.14

RUN apt-get update

# Install poppler for pdf2image (converting pdf to images)
RUN apt-get install poppler-utils -y

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY uv.lock pyproject.toml /app/

COPY docile /app/docile
COPY LICENSE /app/LICENSE
COPY README.md /app/README.md

RUN uv sync --locked --extra interactive
