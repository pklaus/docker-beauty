#!/bin/bash

set -ex

docker build --squash -t pklaus/beauty:app-latest .
