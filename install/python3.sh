#!/bin/bash
apt update
apt install python3 python3-pip gfortran python3-dev

sudo -H pip3 install --upgrade pip

PACKAGES=(
    setuptools
    wheel
    virtualenv
    requests
    numpy
    scipy
    matplotlib
    sphinx
    jupyter
    pandas
    bottleneck
    numexpr
    yapf
    prospector
    mypy-lang
    typed-ast
)

sudo -H pip3 install ${PACKAGES[@]}