# fastapi-template
Boilerplate code for basic start of a new fastapi project

# USAGE
First run the following commands to set up your environment (macOS):

```
pip3 install poetry
python3 -m venv .venv
source .venv/bin/activate
poetry install
```

Then run `make docker_run` and the server will be available on localhost:5001

You can edit the pyproject.toml to name it after your app, same with the Makefile, you can rename the docker image that gets created.