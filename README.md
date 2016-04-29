# Heroku

To deploy:

    % heroku create
    % heroku addons:create memcachedcloud:30
    % git push heroku master
    % heroku run rake db:migrate

You can test: [Heroku](http://protected-journey-74325.herokuapp.com).

# Running with Docker

To build using [docker-compose](https://docs.docker.com/compose/):

   % docker-compose build
   % docker-compose run web rake db:create
   % docker-compose run web rake db:migrate

And to start:

   % docker-compose up

To run the tests:

   % docker-compose run web rspec

Go to [localhost:3000](http://localhost:3000/).
