FROM python:3.8-slim

# Create a non-root user and group
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

WORKDIR /app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -e .

# Initialize the database
RUN flask --app flaskr init-db

# Change ownership to the non-root user
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Expose the application port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=flaskr
ENV FLASK_ENV=development

# Start the application
ENTRYPOINT ["flask"]
CMD ["run", "--host=0.0.0.0"]
