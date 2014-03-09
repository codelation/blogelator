# Blogelator

[![Build Status](https://travis-ci.org/codelation/blogelator.png?branch=master)](https://travis-ci.org/codelation/blogelator)
[![Code Climate](https://codeclimate.com/github/codelation/blogelator.png)](https://codeclimate.com/github/codelation/blogelator)

Blogelator is a mountable `Rails::Engine` for adding a blog to your Rails app.

## Features

- Awesome writing experience for developers with GitHub Flavored Markdown.
- [Ember.js](http://emberjs.com) backend with live GFM -> HTML preview.
- Follows [Spree](https://github.com/spree/spree)'s conventions for extending and overriding defaults

## Installation

Add this line to your application's Gemfile:

```ruby
gem "blogelator", github: "codelation/blogelator"
```

Install the Blogelator gem with Bundler:

```bash
$ bundle install
```

Use the install generator to set up Blogelator:

```bash
rails g blogelator:install
```

## Configuration

The install generator will create `config/initializers/blogelator.rb`:

```ruby
Blogelator.posts_per_page       = 5
Blogelator.site_name            = "My Awesome Blog"
Blogelator.user_class           = "User"
Blogelator.s3_access_key_id     = ENV["BLOGELATOR_S3_KEY"]
Blogelator.s3_secret_access_key = ENV["BLOGELATOR_S3_SECRET"]
Blogelator.s3_bucket            = ENV["BLOGELATOR_S3_BUCKET"]
```

### Authentication

Blogelator does not include authentication because there's a good chance
you've already added authentication to your Rails app.

TODO: Add info about requirements/configuration.

### Authorization

Blogelator uses [CanCan](https://github.com/ryanb/cancan) for authorization.
By default, any logged in user can create, update, and delete any blog post.

TODO: Add example for limiting access to admin users.

### Styles

The install generator will create three SCSS files in `app/assets/stylesheets/blogelator/`:

- **_variables.scss** - Easiest way to change fonts and/or colors
- **admin.css.scss** - Loads the default styles for the backend
- **application.css.scss** - Loads the default styles for the frontend

### Views

View customization can be done by using [Deface](https://github.com/spree/deface)
or by replacing view templates. If you have experience with customizing 
[Spree](https://github.com/spree/spree), you'll be right at home. Blogelator
aims to follow Spree's conventions, so you can simply follow their documentation:

> <http://guides.spreecommerce.com/developer/view.html#using-deface>

TODO: Add example for using Deface to add author's name to post

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
