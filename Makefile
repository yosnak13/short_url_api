bundle-install:
	docker-compose run --rm backend bundle install --without production

bundle-update:
	docker-compose run --rm backend bundle update

db-migrate:
	docker-compose run --rm backend bundle exec rails db:migrate RAILS_ENV=development

precompile:
	docker-compose run --rm backend bundle exec rails assets:precompile RAILS_ENV=development

test:
	docker-compose run --rm backend bundle exec rspec

up:
	docker-compose up -d

stop:
	docker-compose stop
