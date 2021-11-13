.PHONY: help build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build:
	docker-compose build

clean:
	docker-compse down -v
