FROM python:3.9

WORKDIR /app
COPY . .

# install requirements
RUN pip install -r requirements.txt

# migrations
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py migrate --run-syncdb
# static
RUN python manage.py collectstatic --noinput
CMD ["./manage.py", "runserver", "0.0.0.0:8000"]