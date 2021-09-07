#!/bin/bash
curLayout=$(setxkbmap -query | grep layout | tr -s ' ' | cut -d ' ' -f2)

if [ $curLayout == "us" ]; then
  setxkbmap latam -option caps:swapescape
else
  setxkbmap us -option caps:swapescape
fi
