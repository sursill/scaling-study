.PHONY: help
help:	## Show this help.
	@grep -hE '^[A-Za-z0-9_ \-]*?:.*##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run:	## Run the app
	@docker run --rm --env FORCE_COLOR=1 --env INSTANCE_ID=writer-1a -v ./:/home/node/app -w /home/node/app -p 8080:8080 --name "scaling-study" node:20.16-alpine npm run dev

exec:	## SSH into a container with the app
	@docker run -it --rm -v ./:/home/node/app -w /home/node/app --name "scaling-study" node:20.16-alpine sh

clean:  ## Remove existing containers and volumes make
	@docker container rm --volumes $$(docker ps -a --filter "status=exited" --filter "name=scaling-study" --quiet) &> /dev/null
