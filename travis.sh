#!/usr/bin/env sh

bundle exec rspec &&
RAILS_ENV=development bundle exec rake teaspoon
