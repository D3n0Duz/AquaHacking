get-docker-images:
	docker image ls
get-docker-container:
	docker ps -a
pull-postgis-docker-image:
	docker pull mdillon/postgis
run-postgis-docker:
	docker run --name some-postgis -e POSTGRES_PASSWORD=mysecretpassword -d mdillon/postgis
connect-postgis-docker:
	docker run -it --link some-postgis:postgres --rm postgres \
	sh -c 'exec psql -h localhost -p 5432 -U postgres'

