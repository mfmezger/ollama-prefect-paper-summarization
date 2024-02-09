prefect work-pool create --type process executor-pool --set-as-default
prefect work-pool update executor-pool --concurrency-limit 1
prefect --no-prompt deploy src/utopia_new_search/run.py:main_flow --name main --pool executor-pool --cron "*/1 * * * *"
# poetry run python src/utopia_new_search/run.py

prefect worker start --pool executor-pool