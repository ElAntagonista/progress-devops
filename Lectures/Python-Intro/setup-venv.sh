#!/bin/bash

if [[ -z $1 ]]; then
    exit 1
fi

python3 -m venv $1 && source "${PWD}/${1}/bin/activate"
