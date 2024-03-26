## remove all build, test, coverage and Python artifacts
clean: clean-build clean-pyc clean-test

## remove build artifacts
clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg' -exec rm -f {} +

## remove Python file artifacts
clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +
	rm -rf .mypy_cache/

## remove test and coverage artifacts
clean-test:
	rm -fr .tox/
	rm -f .coverage*
	rm -fr htmlcov/
	rm -rf mypy_report/
	rm -rf *.html
	rm -fr .cache/
	rm -fr .pytest_cache
	rm -f coverage.xml
	rm -rf .ruff_cache

## run python
run:
	poetry run python

## fix with black isort
format:
	poetry run ruff --select I . --fix
	poetry run black .

## check style with ruff, mypy
lint:
	poetry run ruff . --exit-zero --fix
	poetry run mypy .

## run tests
test:
	poetry run pytest

## run tests with coverage
coverage:
	poetry run coverage run -m pytest
	poetry run coverage report

## create code coverage html report
coverage_html:
	poetry run coverage run -m pytest
	poetry run coverage html

	@echo "Open coverate reports htmlcov/index.html in your browser"

## Run all code quality checks
check_quality: format lint coverage

##############################################################################
# Self Documenting Commands                                                  #
##############################################################################
.DEFAULT_GOAL := show-help
# See <https://gist.github.com/klmr/575726c7e05d8780505a> for explanation.
.PHONY: show-help
show-help:
	@echo "$$(tput bold)Available rules:$$(tput sgr0)";echo;sed -ne"/^## /{h;s/.*//;:d" -e"H;n;s/^## //;td" -e"s/:.*//;G;s/\\n## /---/;s/\\n/ /g;p;}" ${MAKEFILE_LIST}|LC_ALL='C' sort -f|awk -F --- -v n=$$(tput cols) -v i=19 -v a="$$(tput setaf 6)" -v z="$$(tput sgr0)" '{printf"%s%*s%s ",a,-i,$$1,z;m=split($$2,w," ");l=n-i;for(j=1;j<=m;j++){l-=length(w[j])+1;if(l<= 0){l=n-i-length(w[j])-1;printf"\n%*s ",-i," ";}printf"%s ",w[j];}printf"\n";}'
