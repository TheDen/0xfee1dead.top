# build app
install:
	npm install -g pm2
	npm install

run:
	nohup ./htopgen.sh >/dev/null 2>&1 & 
	pm2 start server.js -i 0
