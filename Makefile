default: ssl
	docker-compose build
	@docker-compose up -d rails_db
	@docker-compose run --no-deps --rm rails_app bundle install

up: migrate clean
	docker-compose up

migrate:
	@while ! docker-compose run --rm rails_db ls /var/lib/mysql/sample_development > /dev/null ; do sleep 4; echo "."; done
	docker-compose run --rm rails_app bin/rails db:migrate RAILS_ENV=development

update-bundle:
	@docker-compose run --rm rails_app bundle update

ssl:
	mkdir -p .sslkey ssl
	openssl genrsa -out .sslkey/server.key 2048
	openssl genrsa -out ssl/localhost.key 2048
	openssl rsa -in ssl/localhost.key -out .sslkey/localhost.key.rsa

	openssl req -new -key .sslkey/server.key -subj "/C=/ST=/L=/O=/CN=/emailAddress=/" -out .sslkey/server.csr
	openssl req -new -key .sslkey/localhost.key.rsa -subj "/C=US/ST=California/L=Orange/O=IndieWebCamp/CN=localhost/" -out ssl/localhost.csr -config conf/localhost.conf

	openssl x509 -req -days 365 -in .sslkey/server.csr -signkey .sslkey/server.key -out .sslkey/server.crt
	openssl x509 -req -extensions v3_req -days 365 -in ssl/localhost.csr -signkey .sslkey/localhost.key.rsa -out ssl/localhost.crt -extfile conf/localhost.conf

	sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain ssl/localhost.crt
	cat ssl/localhost.key ssl/localhost.crt > ssl/localhost.pem

clean:
	rm -rf tmp


test: docker-rspec docker-rubocop

docker-rspec:o
	docker-compose run --rm rails_app bundle exec rspec

docker-rubocop:
	docker-compose run --no-deps --rm rails_app bundle exec rubocop
