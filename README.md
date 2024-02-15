# recipe-app-api

### Docker
- docker build .
- docker-compose build
- docker-compose run --rm app sh -c "django-admin startproject app ."
- docker-compose run --rm app sh -c "python manage.py startapp <>"
- docker-compose up
- docker-compose run --rm app sh -c "python manage.py test"
- docker-compose run --rm app sh -c "python manage.py makemigrations"
- docker-compose run --rm app sh -c "python manage.py wait_for_db && python manage.py migrate"
- docker-compose run --rm app sh -c "python manage.py <> && flake8"

### Endpoints
##### USER 
- /user/create/ 
  - POST - create new user
- /user/token/
  - POST - create new token
- /user/me/
  - PUT/PATCH - update user
  - GET - get user
##### RECIPE 
- /recipes/
  - GET - list all
  - POST - create new
- /recipes/<id>/
  - GET - get recipe by id
  - PUT/PATCH - update recipe
  - DELETE - delete recipe