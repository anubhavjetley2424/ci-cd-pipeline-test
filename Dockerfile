# Use a slim Python base image
FROM python:3.11-slim

# Don't write .pyc files, make output unbuffered
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Workdir inside container
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port (for docs only; docker run -p handles actual mapping)
EXPOSE 8000

# Use gunicorn for a more "prod-like" server
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
