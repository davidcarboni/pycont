
# Test

FROM python as test

COPY . .
RUN python -m unittest


# Package

FROM python:alpine

COPY app.py ./

RUN python app.py
