# syntax=docker/dockerfile:1
# Multi-stage build of the llm CLI: one shared base, one stage for tests, one for the final image.
#   docker build -t praktikum-llm .               -> runtime image (default, last stage)
#   docker build --target test -t llm-test .      -> runs the tests during the build

ARG PYTHON_IMAGE=python:3.13-alpine

# ---- base: runtime dependencies, shared by the two stages below ----
FROM ${PYTHON_IMAGE} AS base
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- test: dev dependencies and tests; never shipped ----
FROM base AS test
COPY requirements-dev.txt .
RUN pip install --no-cache-dir -r requirements-dev.txt
COPY version.txt ollama_client.py llm.py ./
COPY tests/ tests/
RUN python -m pytest -v

# ---- runtime: application code only, running as a non-root user ----
FROM base AS runtime
RUN adduser -D -u 10001 app
COPY version.txt ollama_client.py llm.py ./
USER app
ENTRYPOINT ["python", "llm.py"]
CMD ["--help"]
