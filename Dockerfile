# STEP 1: Install base image. Optimized for Python.
FROM python:3.8-slim

# STEP 2: Copy the source code in the current directory to the container
# Store it in a folder named /app.
ADD . /app

# STEP 3: Set working directory to /app so we can execute commands in it
WORKDIR /app

# STEP 4: Install required dependencies
RUN pip install -r requirements.txt

# STEP 5: Declare environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# STEP 6: Expose the port that Flask is running on
EXPOSE 5000

# STEP 7: Run Gunicorn production WSGI server
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
