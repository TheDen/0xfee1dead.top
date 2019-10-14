#!/bin/bash

touch public/htop.html
touch public/htop.html.aux

while true; do
  echo q | htop | aha --stylesheet --black --line-fix | sed 's/<\/style>/body {overflow-x: hidden; font-size: 2vh;}<\/style>/g' > ./public/htop.html.aux && mv -f ./public/htop.html.aux ./public/htop.html
  sleep 2
done
