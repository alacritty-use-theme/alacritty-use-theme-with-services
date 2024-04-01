build:
	docker build . -t day_night:latest

run:
	@docker run --rm -it day_night:latest \
		cat /var/tmp/night-and-day/mode

server:
	docker run --rm -it day_night:latest
