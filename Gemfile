source 'https://rubygems.org'

gem "sinatra"
gem 'sequel'
gem "slim"
gem "puma"
gem 'sinatra-flash'

group :development do
  gem "rb-inotify", "~> 0.9" # GNU/Linux only
  gem "rerun"
end

group :production do
  # gems specifically for Heroku go here
  gem "pg"
end

gem "rack-test", require: "rack/test", group: :test




# gem 'sinatra-reloader'
# gem 'rack'
# gem 'rack-flash'