# Use Python 3.8 slim-buster as base image
FROM python:3.8-slim-buster

# Update the package list and install git (if needed)
RUN apt update && apt upgrade -y && apt install git -y

# Set the working directory for the app
WORKDIR /app

# Copy the requirements.txt to the container
COPY requirements.txt /app/requirements.txt

# Install pip dependencies
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the application code
COPY . /app

# Expose the port (optional, only if needed for web app)
EXPOSE 8080

# Set the command to run the bot (starting point)
CMD ["python", "bot.py"]
