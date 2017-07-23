# build app
install:
	sudo npm install -g pm2
	npm install

run:
	./htopgen.sh &	
	pm2 show server && pm2 update server.js -i 0 || pm2 start server.js -i 0 
