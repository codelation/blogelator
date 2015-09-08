# Blogelator

[![Build Status](https://travis-ci.org/codelation/blogelator.png?branch=master)](https://travis-ci.org/codelation/blogelator)
[![Code Climate](https://codeclimate.com/github/codelation/blogelator.png)](https://codeclimate.com/github/codelation/blogelator)

Blogelator is a mountable `Rails::Engine` for adding a blog to your Rails app.

## Demo

Check out Blogelator in action. No login required. Content resets every hour.

- **Blog**: <http://blogelator.herokuapp.com>
- **Admin**: <http://blogelator.herokuapp.com/admin>

## Features

- Awesome writing experience for developers with GitHub Flavored Markdown
- [Ember.js](http://emberjs.com) backend with live GFM -> HTML preview
- Upload images to Amazon S3 via drag and drop

## Installation

Add this line to your application's Gemfile:

```ruby
gem "blogelator"
```

Install the Blogelator gem with Bundler:

```bash
$ bundle install
```

Use the install generator to set up Blogelator:

```bash
$ rails g blogelator:install
```

## Configuration

The install generator will create `config/initializers/blogelator.rb`:

```ruby
Blogelator.s3_access_key_id     = ENV["BLOGELATOR_S3_KEY"]
Blogelator.s3_secret_access_key = ENV["BLOGELATOR_S3_SECRET"]
Blogelator.s3_bucket            = ENV["BLOGELATOR_S3_BUCKET"]
```

### Styles

The install generator will create three SCSS files in `app/assets/stylesheets/blogelator/`:

- **_variables.scss** - Easiest way to change fonts and/or colors
- **admin.css.scss** - Loads the default styles for the backend
- **application.css.scss** - Loads the default styles for the frontend

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
