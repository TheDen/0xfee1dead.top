#!/bin/bash
while true; do 
echo q | htop | aha --stylesheet --black --line-fix | \
  sed 's/<\/style>/body         {overflow-x: hidden;}<\/style>/g' | \
    sed 's/<title>stdin/<title>\/usr\/bin\/htop/g' | \
    sed 's/<\/body>/<script src="\/reload.js"><\/script><\/body>/g' | \
  sed "s/<head>/<head><link rel='shortcut icon' href='favicon.ico' type='image\/x-icon' \/>/g" \
    > ./public/htop.html.aux && mv ./public/htop.html.aux ./public/htop.html; \
    sleep 2; 
done
