#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

help: _header
	${info }
	@echo Opciones:
	@echo -------------------------------
	@echo start / stop / restart
	@echo build / update
	@echo logs / stats
	@echo clean
	@echo -------------------------------

_header:
	@echo ------
	@echo WebDAV
	@echo ------

_urls: _header
	${info }
	@echo -------------------------------
	@echo [WebDAV] http://localhost:${PORT}
	@echo -------------------------------

_start_command:
	@docker compose up -d

start: _start_command _urls

stop:
	@docker compose rm -fs

restart: stop start

build:
	@docker compose build

update:
	@docker compose build --pull

logs:
	@docker compose logs

stats:
	@docker stats

clean:
	@docker compose down -v --remove-orphans
