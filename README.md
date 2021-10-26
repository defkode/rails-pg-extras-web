# RailsPgExtrasWeb
Web UI for [rails-pg-extras](https://github.com/pawurb/rails-pg-extras)

![WebUI](https://raw.githubusercontent.com/pawurb/rails-pg-extras/master/rails-pg-extras-web.png)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails-pg-extras-web'
```

And then execute:
```bash
$ bundle
```

Update config/routes.rb

```ruby
mount RailsPgExtrasWeb::Engine, at: 'pg_extras'
```

Authorization in production enviroment via HTTP Basic. Please set PG_EXTRAS_USER, PG_EXTRAS_PASSWORD environment variables.

Heroku example

```bash
heroku config:set PG_EXTRAS_USER=admin PG_EXTRAS_PASSWORD=secret
```



## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
