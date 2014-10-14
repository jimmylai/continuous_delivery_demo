setup:
	sudo apt-get -y install make
	sudo apt-get -y install git
	sudo apt-get -y install python-django
	sudo apt-get -y install python-djangorestframework
	sudo apt-get -y install python-requests
	sudo apt-get -y install python-nose
	sudo apt-get -y install pylint
	sudo apt-get -y install python-markdown
	sudo apt-get -y install python-coverage

unittest:
	export DJANGO_SETTINGS_MODULE=web.settings
	nosetests --with-doctest --doctest-tests --with-xunit --with-coverage --nocapture -w web  --cover-package calculator
	python -m coverage xml