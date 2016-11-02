# distributed-systems-client
First lab Distributed System TCD

## Run with docker
To see if this works on Nebula. Tested with docker-machine, from a node which controls other nodes :

	docker run -i -w /app -p 80 hugodelval/tcp-client /usr/local/bin/tcp-client-exe 10.62.0.15 80 "whatever message you like, with lines feeds and sp&cials ch@rs for ex."

Apache should be running on this (private) IP.

## Run using stack
To launch using stack:

In one terminal :

	php -S localhost:8000 -t .

In another one :

	stack build
	stack exec tcp-client-exe localhost 8000 "whatever message you like, with lines feeds and sp&cials ch@rs for ex."

