#!/bin/bash

rake db:migrate RAILS_ENV="production"
heroku run rake db:migrate --app carda
git push heroku master


