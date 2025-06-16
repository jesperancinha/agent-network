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
update-npm:
	cd moving-objects-gui;\
	npm install -g npm-check-updates; \
	npx browserslist;\
	ncu -u;\
	yarn
deps-cypress-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/cypressUpdateOne.sh | bash
deps-plugins-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/pluginUpdatesOne.sh | bash -s -- $(PARAMS)
deps-update: update-npm
deps-java-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/javaUpdatesOne.sh | bash
deps-gradle-update:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/gradleUpdatesOne.sh | bash
deps-quick-update: deps-cypress-update deps-plugins-update deps-java-update deps-gradle-update
update-repo-prs:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/update-all-repo-prs.sh | bash
accept-prs:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/acceptPR.sh | bash
dc-migration:
	curl -sL https://raw.githubusercontent.com/jesperancinha/project-signer/master/setupDockerCompose.sh | bash
