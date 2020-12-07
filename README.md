# PgExtras::Web
Web UI for rails-pg-extras

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'pg_extras-web', github: 'defkode/pg_extras_web'
```

And then execute:
```bash
$ bundle
```

Update config/routes.rb

```ruby
mount PgExtras::Web::Engine, at: 'pg_extras'
```


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
