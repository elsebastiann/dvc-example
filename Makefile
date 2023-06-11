repo_setup:
	cookiecutter https://github.com/drivendata/cookiecutter-data-science
	mv Makefile dvc-example/
	cd dvc-example/
	git init
	mkdir dvc-example/config
	rm dvc-example/requirements.txt
	rm dvc-example/tox.ini
	rm dvc-example/test_environment.py
	rm dvc-example/setup.py
	
precommit_set_up:
	echo 'repos:' > .pre-commit-config.yaml
	echo '-   repo: https://github.com/ambv/black' >> .pre-commit-config.yaml
	echo '    rev: 23.3.0'  >> .pre-commit-config.yaml
	echo '    hooks:'  >> .pre-commit-config.yaml
	echo '    - id: black'  >> .pre-commit-config.yaml
	echo '      args: [-l 78]'  >> .pre-commit-config.yaml
	echo '-   repo: https://github.com/PyCQA/flake8'  >> .pre-commit-config.yaml
	echo '    rev: 6.0.0' >> .pre-commit-config.yaml
	echo '    hooks:' >> .pre-commit-config.yaml
	echo '    - id: flake8' >> .pre-commit-config.yaml
	echo '-   repo: https://github.com/timothycrosley/isort' >> .pre-commit-config.yaml
	echo '    rev: 5.12.0' >> .pre-commit-config.yaml
	echo '    hooks:' >> .pre-commit-config.yaml
	echo '    - id: isort' >> .pre-commit-config.yaml
	echo '-   repo: https://github.com/econchick/interrogate' >> .pre-commit-config.yaml
	echo '    rev: 1.5.0' >> .pre-commit-config.yaml
	echo '    hooks:' >> .pre-commit-config.yaml
	echo '    - id: interrogate' >> .pre-commit-config.yaml
	echo '      args: [-vv, -i, --fail-under=10]' >> .pre-commit-config.yaml
	echo 'Setting up pre-commit...'
	export PRE_COMMIT_HOME=config/pre-commit/
	export PRE_COMMIT_CONFIG=config/.pre-commit-config.yaml
	pre-commit install
	pre-commit autoupdate
	
poetry_file:
	echo 'Creating .venv...'
	echo '[tool.poetry]' > pyproject.toml
	echo 'name = "dvc-example"' >> pyproject.toml
	echo 'version = "0.1.0"' >> pyproject.toml
	echo 'description = ""' >> pyproject.toml
	echo 'authors = ["Your Name <yourname@example.com>"]' >> pyproject.toml
	echo 'license = "MIT"' >> pyproject.toml
	echo '' >> pyproject.toml
	echo '[tool.poetry.dependencies]' >> pyproject.toml
	echo 'python = "^3.8.1"' >>pyproject.toml
	echo '' >> pyproject.toml
	echo '[tool.poetry.dev-dependencies]' >> pyproject.toml
	echo 'pre-commit = "^3.3.1"'>>pyproject.toml
	echo 'flake8 = "^6.0.0"' >> pyproject.toml
	echo 'black = "^23.3.0"'>> pyproject.toml
	echo 'interrogate = "^1.5.0"' >> pyproject.toml
	echo 'isort = "^5.12.0">>' pyproject.toml
	echo '' >> pyproject.toml
	echo '[build-system]' >>pyproject.toml
	echo 'requires = ["poetry>=1.1.0"]' >>pyproject.toml
	echo 'build-backend = "poetry.masonry.api"' >> pyproject.toml
