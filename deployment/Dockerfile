# Use official lightweight Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

# Set working directory
WORKDIR /app

# Install system dependencies (build-essential needed for compiling packages if needed)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . /app

# Expose port 8080
EXPOSE 8080

# Run FastAPI unified backend using Gunicorn with Uvicorn workers
CMD exec gunicorn -k uvicorn.workers.UvicornWorker --chdir backend main:app --bind 0.0.0.0:$PORT
