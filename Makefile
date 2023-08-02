VENV := env
BIN := $(VENV)/bin
PYTHON := python3
SHELL := /bin/bash
APP :=
static :=
appname :=
newapp :=

.PHONY: help
help:
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?##"}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: list
list:
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?##"}; {printf "\033[0m%-20s\033[0m %s\n", $$1, $$3}'

.PHONY: venv
venv: ## Make a new virtual environment
	python3 -m venv $(VENV) && source $(BIN)/activate

.PHONY: install
install: venv ## Make venv and install requirements
	$(BIN)/pip install --upgrade -r requirements.txt

.PHONY: freeze
freeze: ## Pin current dependencies
	$(BIN)/pip freeze > requirements.txt

.PHONY: migrate
migrate: ## Make and run migrations
	$(PYTHON) manage.py makemigrations
	$(PYTHON) manage.py migrate

.PHONY: test
test: ## Run tests
	$(PYTHON) manage.py test $(APP)

.PHONY: check
check: ## Check for error
	$(PYTHON) manage.py check

.PHONY: run
run: ## Run the Django server
	$(PYTHON) manage.py runserver

.PHONY: auto-models
auto-models:
	$(PYTHON) manage.py inspectdb > models.py

.PHONY: diffsettings
diffsettings: ## Displays differences between the current settings.py and Django's default settings
	$(PYTHON) manage.py diffsettings > settings.txt

.PHONY: showmigrations
showmigrations: ## Shows all available migrations for the current project
	$(PYTHON) manage.py showmigrations > migrations.txt

.PHONY: findstatic
findstatic: ## Finds the absolute paths for the given static file(s). mention the path with Make findstatic static=test/main.css
	$(PYTHON) manage.py findstatic $(static) --verbosity 0

.PHONY: collectstatic
collectstatic: ## Collect static files in a single location
	$(PYTHON) manage.py collectstatic

.PHONY: dbshell
dbshell: ## Runs the command-line client for specified database, or the default database
	$(PYTHON) manage.py dbshell

.PHONY: flush
flush: ## Removes ALL DATA from the database, including data added during migrations
	$(PYTHON) manage.py flush

.PHONY: sqlflush
sqlflush: ## Returns a list of the SQL statements required to return all tables in the database to the state they were in just after they were installed
	$(PYTHON) manage.py sqlflush > sqlflush.sql

.PHONY: sqlsequencereset
sqlsequencereset: ## Prints the SQL statements for resetting sequences for the given app name(s)."make sqlsequencereset appname=app1"
	$(PYTHON) manage.py sqlsequencereset $(appname) > sqlsequencereset.sql

.PHONY: startapp
startapp: ## creates a new django app, "make startapp newapp=app1"
	$(PYTHON) manage.py startapp $(newapp)

.PHONY: start
start: install migrate run ## Install requirements, apply migrations, then start development server

.PHONY: requirements-dev
requirements-dev: venv ## Install development-only requirements
	$(BIN)/pip install --upgrade -r requirements-dev.txt

.PHONY: clean
clean: ## Clean up temporary files and build artifacts
	rm -rf __pycache__/ *.pyc *.pyo *.pyd *.pyw *.pyz *.pyzw
