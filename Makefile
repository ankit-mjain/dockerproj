setup:
	python3 -m venv ~/.dockerproj
	
install:
	pip install --upgrade pip && \
	pip install -r requirements.txt
	
test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest -vv --nbval notebook.ipynb
	
validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	./cirlceci config process .circleci/config.yml
	
run-circleci-local:
	circleci local execute
	
lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py
	
