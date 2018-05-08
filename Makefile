# build app

.PHONY: install
install:
	sudo npm install -g pm2
	npm install

.PHONY: stop
stop:
	pm2 delete live-htop || true
	kill $$(pgrep -f htopgen.sh) || true

.PHONY: start
start:
	./htopgen.sh &
	pm2 start process.yml
