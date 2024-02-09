FROM prefecthq/prefect:2.13.4-python3.11

# install poetry and dependencies
# Install Poetry
RUN apt update && apt install -y curl
RUN curl -sSL https://install.python-poetry.org/ | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false
RUN poetry config installer.max-workers 10

COPY . .
# WORKDIR /app
RUN poetry install

RUN pip install --upgrade transformers


# ENTRYPOINT ["poetry", "run", "python", "src/utopia_new_search/run.py"]
# watch the logs
# CMD ["tail", "-f", "/dev/null"]
CMD ["sh", "startup.sh"]