# Tools used

* Ruby 2.3.0 (latest stable version);
* PostgreSQL;
* Redis to cache;
* [Twitter gem](https://rubygems.org/gems/twitter);
* [Bootstrap](http://getbootstrap.com);

Development env:

* Rspec and [Phantomjs](http://phantomjs.org/) to test;
* VCR to avoid calling external services when running tests;
* Files to automatize development using [Docker](docker.com) and
[docker-compose](https://docs.docker.com/compose/) are provided as well;

# Heroku

To deploy:

    % heroku create
    % heroku addons:create redistogo:nano
    % git push heroku master
    % heroku run rake db:migrate

You can test: [Heroku](http://protected-journey-74325.herokuapp.com).

# Running with Docker

To build using [docker-compose](https://docs.docker.com/compose/):

    % cp .env.sample .env
    % cp config/database.yml.sample config/database.yml
    % docker-compose build
    % docker-compose run web rake db:create
    % docker-compose run web rake db:migrate

And to start:

    % docker-compose up

Go to [localhost:3000](http://localhost:3000/).

To run the tests:

    % docker-compose run web rspec
