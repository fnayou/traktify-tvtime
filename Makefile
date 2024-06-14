#--- Makefile common
# COLORS
RED  := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
CYAN  := $(shell tput -Txterm setaf 6)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

$(info ${YELLOW}###################${RESET})
$(info ${YELLOW}# ${WHITE}Traktify TVTime ${YELLOW}#)
$(info ${YELLOW}###################${RESET})
$(info )

TARGET_MAX_CHAR_NUM=20
## show help
help:
	@echo ''
	@echo '${YELLOW}Usage${RESET}:'
	@echo '  make <target>'
	@echo ''
	@echo '${YELLOW}Targets${RESET}:'
	@awk '/^[a-zA-Z\-\\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${GREEN}%-$(TARGET_MAX_CHAR_NUM)s${RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help
#--- /end of Makefile common

####
## globals
########################
DOCKER_COMPOSE  = @docker compose

####
## docker-compose tasks
########################

## docker: pull and build
build:
	$(DOCKER_COMPOSE) build --pull
## docker: pull and build without cache
build-nocache:
	$(DOCKER_COMPOSE) build --pull --no-cache
.PHONY: build build-nocache


####
## main script
########################

## Run the download script inside the container
traktifytvtime: 
	$(DOCKER_COMPOSE) run traktifytvtime