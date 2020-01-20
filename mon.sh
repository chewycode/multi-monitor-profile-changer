#!/bin/bash

# see if xrandr is installed
if [ ! command -v foobar &> /dev/null ]
then
  echo "xrandr is not installed"
  exit 1
fi

MONITOR1="DP-3"
MONITOR2="DVI-I-1"
MONITOR3="DP-5"
MONITOR4="HDMI-0" #4ktv

if [[ $SSH_TTY=1 ]] #if you are connected by ssh
then
  DISPLAY=:0.0
  export DISPLAY
fi

case $2 in

  4[kK])
    MONITOR4_RES="3840x2160"
    MIRROR=" --right-of $MONITOR3"
    ;;

  [mM][iI][rR][rR][oO][rR]1)
    MONITOR4_RES="1920x1080"
    MIRROR=" --same-as $MONITOR1"
    ;;

  [mM][iI][rR][rR][oO][rR]2)
    MONITOR4_RES="1920x1080"
    MIRROR=" --same-as $MONITOR2"
    ;;
  
  [mM][iI][rR][rR][oO][rR]3)
    MONITOR4_RES="1920x1080"
    MIRROR=" --same-as $MONITOR3"
    ;;

  "")
    MONITOR4_RES="1920x1080"
    MIRROR=" --right-of $MONITOR3"
    ;;

  *)
    echo -n 'Invalid 2nd argument.'
    exit 1 #exits the script
    ;;
esac

case $1 in

  1111)
    xrandr \
    --output $MONITOR1 --mode 1920x1080 --rate 60.00 \
    --output $MONITOR2 --primary --mode 1920x1080 --rate 60.00 --right-of $MONITOR1 \
    --output $MONITOR3 --mode 1920x1080 --rate 60.00 --right-of $MONITOR2 \
    --output $MONITOR4 --mode ${MONITOR4_RES} --rate 60.00${MIRROR}
    echo "3 Monitor Desk + $MONITOR4_RES TV Setup Loaded"
    ;;

  1110)
    xrandr \
    --output $MONITOR1 --mode 1920x1080 --rate 60.00 \
    --output $MONITOR2 --primary --mode 1920x1080 --rate 60.00 --right-of $MONITOR1 \
    --output $MONITOR3 --mode 1920x1080 --rate 60.00 --right-of $MONITOR2 \
    --output $MONITOR4 --off
    echo "3 Monitor Desk Setup Loaded"
    ;;
  
  1100)
    xrandr \
    --output $MONITOR1 --mode 1920x1080 --rate 60.00 \
    --output $MONITOR2 --primary --mode 1920x1080 --rate 60.00 --right-of $MONITOR1 \
    --output $MONITOR3 --off \
    --output $MONITOR4 --off
    echo "Left 2 Monitor Desk Setup Loaded"
    ;;

  0110)
    xrandr \
    --output $MONITOR1 --off \
    --output $MONITOR2 --primary --mode 1920x1080 --rate 60.00 \
    --output $MONITOR3 --mode 1920x1080 --rate 60.00 --right-of $MONITOR2 \
    --output $MONITOR4 --off
    echo "Right 2 Monitor Desk Setup Loaded"
    ;;

  0001)
    xrandr \
    --output $MONITOR1 --off \
    --output $MONITOR2 --off \
    --output $MONITOR3 --off \
    --output $MONITOR4 --mode $MONITOR4_RES --rate 60.00 --primary
    echo "TV $MONITOR4_RES Only Setup Loaded"
    ;;

  "")
    echo "mon usage"
    echo "1st argument is 4 digits long consisting of 1's and 0's"
    echo "   1 means the monitor is on, 0 means the monitor is off"
    echo "   Example: mon 1110"
    echo "   This will turn on all monitors except very right one."
    echo "Acceptable 2nd arguments:"
    echo "   4k: TV will be 4k"
    echo "   mirror1 or mirror2 or mirror3: TV will be a mirror of the respective monitor"
    ;;

  *)
    echo -n "Unknown monitor profile."
    echo -n "Try again."
    echo
    ;;
esac
