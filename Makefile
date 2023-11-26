SHELL := /bin/bash
GITHUB_RUN_ID ?=123

b: build-node
build-node:
	cd agents-apollo-server && yarn
	cd agents-grand-stack && yarn
	#cd agents-rest && yarn
test-node:
	cd agents-apollo-server && yarn
	cd agents-grand-stack && yarn
	#cd agents-rest && yarn
coverage-node:
	echo "Nothing is implemented yet.."
node-update-old:
	sudo npm cache clean -f
	sudo npm install -g n
	sudo n stable
node-update:
	curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | sh
	source ~/.nvm/nvm.sh
	nvm install --lts
	nvm use --lts
