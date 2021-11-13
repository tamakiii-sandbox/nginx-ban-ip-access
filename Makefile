.PHONY: help test

PORT_HTTP := 80

help:
	@cat $(firstword $(MAKEFILE_LIST))

test: \
	test-localhost \
	test-dev-localhost \
	test-ip
	echo "test pass"

test-localhost:
	curl -s http://localhost:$(PORT_HTTP) | grep 'OK'
	curl -s -D - http://localhost:$(PORT_HTTP) | grep 'Content-Type: text/plain;charset=UTF-8'
	curl -s -D - http://localhost:$(PORT_HTTP) | grep 'X-Http-Ok:'

test-dev-localhost:
	curl -s -H 'Host: test.localhost' http://localhost:$(PORT_HTTP) | grep 'OK'
	curl -s -D - -H 'Host: test.localhost' http://localhost:$(PORT_HTTP) | grep 'Content-Type: text/plain;charset=UTF-8'
	curl -s -D - -H 'Host: test.localhost' http://localhost:$(PORT_HTTP) | grep 'X-Http-Ok:'
	curl -s -H 'Host: test.localhost' http://127.0.0.1:$(PORT_HTTP) | grep 'OK'
	curl -s -D - -H 'Host: test.localhost' http://127.0.0.1:$(PORT_HTTP) | grep 'Content-Type: text/plain;charset=UTF-8'
	curl -s -D - -H 'Host: test.localhost' http://127.0.0.1:$(PORT_HTTP) | grep 'X-Http-Ok:'

test-ip:
	curl -sS http://127.0.0.1:$(PORT_HTTP) 2>&1 | grep 'Empty reply from server'
