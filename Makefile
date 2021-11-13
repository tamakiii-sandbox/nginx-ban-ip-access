.PHONY: help test

PORT_HTTP := 80

help:
	@cat $(firstword $(MAKEFILE_LIST))

test:
	curl -s http://localhost:$(PORT_HTTP) | grep 'OK'
	curl -s -D - http://localhost:$(PORT_HTTP) | grep 'Content-Type: text/plain;charset=UTF-8'
	curl -s -D - http://localhost:$(PORT_HTTP) | grep 'X-Http-Ok:'
	echo "test pass"
