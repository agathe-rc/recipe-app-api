# Image from which to build
FROM python:3.7-alpine
# maintainer file
MAINTAINER Agathe Raymond-Carlo

# Environment variables
# Runs python in unbuffered mode - avised when running on Docker
ENV PYTHONBUFFERED 1

# Dependencies
# Copy from the directory to the docker image
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app

# Set as default directory
WORKDIR /app

COPY ./app /app

# Create a user for running apps only and switch to it (security purposes - do not run app as root)
RUN adduser -D user
USER user