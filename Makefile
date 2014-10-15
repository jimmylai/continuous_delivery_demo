setup:
	sudo apt-get -y install make
	sudo apt-get -y install git sudo apt-get -y install python-django
	sudo apt-get -y install python-djangorestframework
	sudo apt-get -y install python-requests
	sudo apt-get -y install python-nose
	sudo apt-get -y install pylint
	sudo apt-get -y install python-markdown
	sudo apt-get -y install python-coverage
	sudo apt-get -y install jenkins

setup_jenkins:
	wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
	sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
	sudo apt-get update
	sudo apt-get -y install jenkins

clean:
	-rm coverage.xml
	-rm nosetests.xml

unittest: clean
	export DJANGO_SETTINGS_MODULE=web.settings; nosetests --with-doctest --doctest-tests --with-xunit --with-coverage --nocapture -w web  --cover-package calculator
	python -m coverage xml

functest:
	cd web; python manage.py runserver 0.0.0.0:8888 &
	sleep 3
	nosetests --with-doctest --doctest-tests --with-xunit --nocapture -w functional_tests
	ps aux | grep -ie "0.0.0.0:8888"  | awk '{print $$2}' | xargs kill -9
