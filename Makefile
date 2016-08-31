default:
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

clean:
	rm -rf tmp


test: docker-rspec docker-rubocop

docker-rspec:
	docker-compose run --rm rails_app bundle exec rspec

docker-rubocop:
	docker-compose run --no-deps --rm rails_app bundle exec rubocop
