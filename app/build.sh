#!/bin/bash

set -ex

docker build --squash -t beauty-app .
