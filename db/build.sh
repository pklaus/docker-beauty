#!/bin/bash

set -ex

docker build --squash -t epics_css_archiver_db .
