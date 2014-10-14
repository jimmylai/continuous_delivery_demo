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
	nosetests --with-doctest --doctest-tests --with-xunit --with-coverage --nocapture --cover-tests -w data/flight_mapping --cover-package mapping
	python -m coverage xml
