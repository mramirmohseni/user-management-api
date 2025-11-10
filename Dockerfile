FROM python:3.13.5-alpine

# Set environment variables
# PYTHONDONTWRITEBYTECODE: Prevents Python from creating .pyc files. Docker containers doesn't need compiled bytecode files. This keeps containers clean
# PYTHONUNBUFFERED: its for debugging. Makes Python output appear immediately in Docker logs. Without this, you won't see Django logs in real-time
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install system dependencies
RUN apk add --no-cache \
    postgresql-dev \
    gcc \
    musl-dev

# Copy requirements directory
COPY ./requirements /requirements

# Install Python dependencies from development.txt (which includes base.txt)
RUN pip install --no-cache-dir -r /requirements/development.txt

# Copy project source code
COPY ./src /app

# Copy scripts directory
COPY ./scripts /scripts

# Make run.sh executable
RUN chmod +x /scripts/run.sh

# Create non-root user and set ownership
RUN adduser --disabled-password --no-create-home app && \
    chown -R app:app /app && \
    chown -R app:app /scripts

# Switch to non-root user
USER app

# Optional: Add scripts to PATH for convenience (docker exec, etc.)
# But still use explicit path in CMD
ENV PATH="/scripts:$PATH"

EXPOSE 8000

# Use the script as entrypoint
CMD ["/scripts/run.sh"]



