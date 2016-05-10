#!/bin/bash

rake db:migrate RAILS_ENV="production"
heroku run rake db:migrate
git push heroku master