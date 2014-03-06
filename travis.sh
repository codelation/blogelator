#!/usr/bin/env sh

bundle exec rspec &&
phantomjs spec/qunit_runner.js http://localhost:3000/qunit