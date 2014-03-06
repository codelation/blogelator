#!/usr/bin/env sh

bundle exec rspec &&
bundle exec phantomjs spec/qunit_runner.js http://localhost:3000/qunit