source 'https://rubygems.org'

gemspec

group :test do
  gem 'activerecord', '>= 5.0'
  # A database backend that translates database interactions into no-ops. Using
  # NullDB enables you to test your model business logic - including after_save
  # hooks - without ever touching a real database.
  gem 'activerecord-nulldb-adapter'
  gem 'rspec', '~> 3.10'
  # Use rubocop to lint our Ruby codes
  gem 'rubocop', '~> 1.0'
  gem 'pry'
  gem 'pry-nav'
  gem 'simplecov', require: false
  gem 'codecov', require: false
  gem 'webmock', '~> 3.0'
end
