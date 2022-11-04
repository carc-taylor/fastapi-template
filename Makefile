IMG ?= fastapi-template:v1.0.0
LOCAL_PORT ?= 5001
SERVER_PORT = 5000
ENV_FILE_PATH ?= .env

dep:
	poetry install

dev: dep
	poetry run flask run -h 0.0.0.0 -p ${LOCAL_PORT}

prod: dep
	poetry run gunicorn app:app -b=0.0.0.0:${LOCAL_PORT}

docker_build:
	@docker build -t ${IMG} .

docker_run: docker_build
	@docker run --env-file ${ENV_FILE_PATH} -p ${LOCAL_PORT}:${SERVER_PORT} ${IMG}
