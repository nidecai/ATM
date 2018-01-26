TEST_CMD=setup.py test --addopts --boxed
clean:
	find . -name '*.pyo' -delete
	find . -name '*.pyc' -delete
	find . -name __pycache__ -delete
	find . -name '*~' -delete

lint:
	flake8 atm && isort --check-only --recursive atm

test: lint
	python $(TEST_CMD)

installdeps:
	sudo apt-get install sqlite3 mysql-server mysql-client libmysqlclient-dev
	pip install --upgrade pip
	pip install -e .
	pip install -r dev-requirements.txt

