
# Git revision

FROM alpine/git as repo

WORKDIR /repo
ADD .git .git
RUN git rev-parse --short HEAD > commit.hash


# Unit test

FROM python as test

WORKDIR /unittest
COPY . .
RUN python -m unittest


# Package

FROM python:alpine
RUN pip3 install gunicorn

WORKDIR /app
COPY . .
RUN pip3 install -r requirements.txt
COPY --from=repo /repo/commit.hash ./


# Run with Gunicorn

ENV WORKERS=4
CMD /usr/local/bin/gunicorn --bind 0.0.0.0:5000 --workers ${WORKERS} app:app
