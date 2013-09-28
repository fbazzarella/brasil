source 'https://rubygems.org'

gem 'rails', '3.2.14'
gem 'pg'
gem 'mypg'
gem 'haml'

gem 'omniauth-facebook-rails',
  git:    'git://github.com/fbazzarella/omniauth-facebook-rails.git',
  branch: 'feature/location'

gem 'pry-rails'
gem 'awesome_print'

group :assets do
  gem 'jquery-rails'
  gem 'yui-compressor'
  gem 'therubyracer'
end

group :development do
  gem 'thin'
  gem 'shuttle'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
end
