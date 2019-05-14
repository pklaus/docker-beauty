#!/bin/bash

set -ex

VARIANT=openjdk12 # or oraclejava12

KEY=$(xauth list | grep "$(hostname)/unix:0" | awk '{ print $3 }' | head -n 1)
CONT_HOSTNAME=docker-phoebus
xauth add $CONT_HOSTNAME/unix:0 . $KEY

docker run \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/tmp/.Xauthority \
    -v /dev/snd:/dev/snd \
    -e DISPLAY=unix$DISPLAY \
    -e XAUTHORITY=/tmp/.Xauthority  \
    -h $CONT_HOSTNAME \
    --device=/dev/dri:/dev/dri \
    --network beauty-net \
    --rm -it \
  pklaus/beauty:phoebus_$VARIANT \
  ./phoebus.sh -settings settings.ini -resource pv://?root:aiExample\&root:ai2\&app=databrowser

# Alternative startup options:
  #/bin/bash # -> ./phoebus.sh
  #./phoebus.sh -settings settings.ini -app databrowser
  #./phoebus.sh -settings settings.ini -resource pv://?root:aiExample\&root:ai2\&app=pv_table
  #./phoebus.sh -list

xauth remove $CONT_HOSTNAME/unix:0
