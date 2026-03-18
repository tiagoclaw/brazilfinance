# BrazilFinance API - Railway Container No Shell
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy startup script and backend application
COPY start.py ./
COPY backend/app ./app/

# Make startup script executable
RUN chmod +x start.py

# Create non-root user
RUN useradd --create-home appuser && chown -R appuser:appuser /app
USER appuser

# Start using Python script (no shell commands)
CMD ["python", "start.py"]