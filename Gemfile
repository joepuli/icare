source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'mongoid', '~> 5.1.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'slim', '~> 3.0.6'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks', '~> 5.0.0.beta'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'devise', '~> 4.0.0.rc1'
gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'octicons-rails'
gem 'rails-assets-tether', '>= 1.1.0'
gem 'soda-ruby', require: 'soda'
gem 'geocoder', '~> 1.3.0'
gem 'gmaps4rails', '~> 2.1.0'
gem 'underscore-rails', '~> 1.8.0'
gem 'simple_form', '~> 3.2.1'
gem 'font-awesome-rails'
gem 'passenger', '>= 5.0.25', require: 'phusion_passenger/rack_handler'
gem 'kaminari', git: 'git://github.com/amatsuda/kaminari.git', branch: 'master'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4.0'
  gem 'mongoid-rspec', '3.0.0'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'faker'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'spring'
  gem 'rack-mini-profiler'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'puma'
end

group :production do
  # gem 'passenger', '>= 5.0.25', require: 'phusion_passenger/rack_handler'
end

group :test do
  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'capybara', '~> 2.6.0'
end
