.PHONY: test release

test:
	docker-compose build --pull release
	docker-compose build
	docker-compose run test

release:
	docker-compose up --abort-on-container-exit migrate
	docker-compose run app python3 manage.py collectstatic --no-input
	docker-compose up --abort-on-container-exit acceptance
	