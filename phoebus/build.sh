#!/bin/bash

set -ex

wget https://controlssoftware.sns.ornl.gov/css_phoebus/nightly/phoebus-linux.zip
unzip -o phoebus-linux.zip
mv phoebus-0.0.1 phoebus

docker build -t ubuntu_oraclejava12 -f Dockerfile.ubuntu_oraclejava12 .
docker build -t pklaus/beauty:phoebus_oraclejava12 -f Dockerfile.phoebus_oraclejava12 .
docker build -t pklaus/beauty:phoebus_openjdk12 -f Dockerfile.phoebus_openjdk12 .

rm -r phoebus
rm phoebus-linux.zip
