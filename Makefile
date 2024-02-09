run:
	rm -rf data/
	poetry run python src/utopia_new_search/run.py

restart:
	docker compose down --remove-orphans
	docker compose up --build

clean:
	find . -type f -name "*.DS_Store" -ls -delete
	find . | grep -E "(__pycache__|\.pyc|\.pyo)" | xargs rm -rf
	find . | grep -E ".pytest_cache" | xargs rm -rf
	find . | grep -E ".ipynb_checkpoints" | xargs rm -rf
	rm -rf .coverage*