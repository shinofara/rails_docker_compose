default:
	docker-compose build

up: migrate clean
	docker-compose up

migrate:
	@docker-compose up -d rails_db
	@while ! docker-compose run --rm rails_db ls /var/lib/mysql/sample_development > /dev/null ; do sleep 4; echo "."; done
	docker-compose run --rm rails_app bin/rails db:migrate RAILS_ENV=development

clean:
	rm -rf tmp
