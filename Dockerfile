FROM ubuntu:20.04


# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_NO_INTERACTION=1
ENV PATH="$POETRY_HOME/bin:$PATH"


COPY entrypoint.sh /entrypoint.sh


RUN \
    set -x \
    # update system
    && apt-get update \
    # install requirements
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        wget \
        git \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        zlib1g-dev \
        libffi-dev \
        openssl \
        #optional libraries
        libgdbm-dev \
        libgdbm6 \
        uuid-dev \
        #upx
        upx \
        python3 \
        python3-distutils \
        python3-pip \
        python3-dev \
    && pip install --upgrade pip \
    && mkdir /src/ \
    && chmod +x /entrypoint.sh


# POETRY INSTALL
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
RUN poetry config virtualenvs.create false


VOLUME /src
WORKDIR /src


ENTRYPOINT ["/entrypoint.sh"]
