FROM python:3.9

WORKDIR /app
COPY . .

# install requirements
RUN pip install -r requirements.txt
RUN chmod +x run_app.sh

ENTRYPOINT ["/bin/bash", "/app/run_app.sh"]