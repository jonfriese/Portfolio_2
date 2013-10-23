source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.14'
gem 'devise'
gem 'pundit'
gem 'pry-rails'
gem 'omniauth-twitter'
gem 'figaro'
gem 'strong_parameters'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

gem 'bootstrap-sass-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development, :test do
  gem "sqlite3"
  gem "minitest", "> 4.0"
  gem "minitest-focus"
  gem "minitest-colorize"
  gem "minitest-rails"
  gem "minitest-rails-capybara"
  gem "capybara-webkit"
  gem "launchy"
  gem "pry-rails"
  gem "pry-doc"
  gem "pry-debugger"
  gem "faker"
  gem 'simplecov', :require => false
end


group :test do
  gem 'turn'
end



