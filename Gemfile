source 'https://rubygems.org'

gem 'rails', '4.1.8'

# @q: what with gem versions
gem 'pg'
gem 'draper'
gem 'decent_exposure'
gem 'decent_decoration'
gem 'devise'
gem 'simple_form', '~> 3.1.0rc'
gem 'bootstrap-sass', '~> 3.1.0'
gem 'bootswatch-rails'
gem 'haml-rails'
gem 'sass-rails', github: 'rails/sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'quiet_assets'
gem 'jquery-rails'
gem 'therubyracer', platforms: :ruby
gem 'travis'
gem 'ffaker'
gem 'konf'
# switch back to previos version due to: Could not find term-ansicolor-1.3.1 in any of the sources
gem 'coveralls', '0.8.0', require: false
gem 'flip'
gem 'rollbar', '~> 1.5.3'

group :development do
  gem 'spring'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor'
end

ruby '2.1.5'
