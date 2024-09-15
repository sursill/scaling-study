.PHONY: help
help:	## Show this help.
	@grep -hE '^[A-Za-z0-9_ \-]*?:.*##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:	## Build images
	@docker build ./backend/ --tag scaling-study-backend:latest

up:	## Spin up service described in compose services
	@docker run --rm --env FORCE_COLOR=1 --env INSTANCE_ID=writer-1a -v ./:/home/node/app -w /home/node/app -p 8080:8080 --name "scaling-study" node:20.16-alpine npm run dev

clean:  ## Remove existing containers and volumes make
	@sudo rm -r storage/*

list:	## List the files generated
	@find ./storage -type f -name "*.txt" | sort

run-natively: ## Run the test in the host system
	@python run.py

# RUNNER RELATED

runner-build: ## Build image for runner
	@docker build . --file runner.Dockerfile --tag scaling-study-runner:latest

runner-run: ## Run the test
	@docker run -it --rm -v ./:/usr/src/app -w /usr/src/app --network=scaling-study_default scaling-study-runner:latest python run.py

exec-runner: ## Exec into runner container
	@docker run -it --rm -v ./:/usr/src/app -w /usr/src/app python:3.12-alpine sh

meta-clean: ## Remove docker images
	@docker image rm $$(docker images --filter "reference=scaling-study-*")
	
