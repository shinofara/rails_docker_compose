default:
	docker-compose build

up: migrate clean
	docker-compose up

migrate:
	docker-compose run --rm rails_app bin/rails db:migrate RAILS_ENV=development

clean:
	rm -rf tmp
