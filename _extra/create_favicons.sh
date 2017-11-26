#!/usr/bin/env bash

set -e

origin=favicon.png
path=../assets/

echo "favicon.ico"
convert $origin -define icon:auto-resize=64,48,32,16 $path/favicon.ico

echo "apple-touch-icon-precomposed.png"
convert $origin -size 180x180 $path/apple-touch-icon-precomposed.png

echo "open-graph-logo.png"
convert $origin -size 200x200 $path/open-graph-logo.png


echo
echo "IMPORTANT!!!"
echo "Modify favicon-date in _config.yml to: `date "+%Y%m%d"`"
