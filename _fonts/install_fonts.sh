#!/bin/sh
fontpath="$(dirname $0)"
cp -r $fontpath/*.ttf ~/.fonts/
fc-cache -f 
