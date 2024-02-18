# Use the official Python 3.11 image as the base image
FROM python:3.11-alpine

# Set an environment variable to avoid buffering of Python output
ENV PYTHONUNBUFFERED 1

# Copy requirements files and the application code to the image
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
#for deployment
COPY ./scripts /scripts

# Set the working directory to the application folder
WORKDIR /app

# Expose port 8000
EXPOSE 8000

# Set an argument for conditional installation of development requirements
ARG DEV=false

# Create a virtual environment, install dependencies, and add a non-root user
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client jpeg-dev && \
    apk add --update --no-cache --virtual .tmp-build-deps \
        build-base postgresql-dev musl-dev zlib zlib-dev linux-headers && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    apk del .tmp-build-deps && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user && \
    mkdir -p /vol/web/media && \
    mkdir -p /vol/web/static && \
    chown -R django-user:django-user /vol && \
    chmod -R 755 /vol/web && \
    chmod -R +x /scripts




# Set the PATH to include the virtual environment
#ENV PATH="/py/bin:$PATH"
# Set PATH for deployment
ENV PATH="/scripts:/py/bin:$PATH"

# Switch to the non-root user
USER django-user

#for deployment
CMD ["run.sh"]