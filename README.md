# Blogelator

[![Code Climate](https://codeclimate.com/github/codelation/blogelator.png)](https://codeclimate.com/github/codelation/blogelator)

Blogelator is a Ruby gem for adding a blog to a Rails project.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "blogelator"
```

Install the Blogelator gem with Bundler:

```bash
bundle install
```

Install the database migrations and migrate the database:

```bash
rake blogelator:install:migrations
rake db:migrate
```

### Active Admin

Blogelator registers the blog posts with [Active Admin](http://activeadmin.info) to
provide the editing interface for your blog posts. Everything works best if you
are using Active Admin and if `current_admin_user` is used to return an authenticated
user who can manage the blog posts when signed in.

If you're not using Active Admin, it should be pretty easy to create a simple interface
for managing your blog posts. The reason the old admin interface was removed was to
simplify the project and remove authorization methods that don't belong in this gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
