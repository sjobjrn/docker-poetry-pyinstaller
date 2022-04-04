#!/bin/bash -i

set -e

. /root/.bashrc

WORKDIR=${SRCDIR:-/src}

cd $WORKDIR

if [ -f pyproject.toml ]; then
    poetry install && poetry add pyinstaller
fi

echo "$@"

sh -c "$@"

