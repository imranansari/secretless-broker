#!/bin/bash -e

echo "Running the TLS frontend, providing it the SSL key as a volume-mounted file"

docker-compose up --no-deps -d myapp_tls

echo "Listing all users using an SSL-verified 'curl' request to 'https://myapp'"

docker-compose run --rm -v $PWD/../src/proxy_tls/proxy_tls.pem:/proxy_tls.pem client curl --cacert /proxy_tls.pem https://myapp_tls
