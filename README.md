# Recipe app API
An API for applications that include recipes is designed to allow users to create or discover recipes and verify ingredient lists. Additionally, users can search for recipes based on tags or ingredients. It is important to note that all logic within the application is thoroughly covered by tests, and the code formatting is verified using Flake8 whenever the project is pushed to GitHub.

### Docker commonly used commands
- docker build .
- docker-compose build
- docker-compose run --rm app sh -c "django-admin startproject app ."
- docker-compose run --rm app sh -c "python manage.py startapp <>"
- docker-compose up
- docker-compose run --rm app sh -c "python manage.py test"
- docker-compose run --rm app sh -c "python manage.py createsuperuser"
- docker-compose run --rm app sh -c "python manage.py makemigrations"
- docker-compose run --rm app sh -c "python manage.py wait_for_db && python manage.py migrate"
- docker-compose run --rm app sh -c "python manage.py <> && flake8"

### Develop endpoints
- api/docs/ - Swagger
- admin/ - Django admin page

### Applications
##### app
The main application of project.

##### core
Application that contains command for waiting for DB, all models of project and general tests (for admin, for command and for models).

##### user
Applications that contains API for manipulating with user account. Also, there is tests for checking created logic.

##### recipe
Application that contains logic for creating, updating, deleting and returning recipes. Also, implemented logic for manipulating with tags and ingredients that connected to recipes. Recipes can be filtered by ingredients or tags. All logic covered by tests.