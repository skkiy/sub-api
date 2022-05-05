source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 6.1.5'
gem 'sqlite3'
gem 'puma', '~> 5.0'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem "jwt"
# gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'devise_token_auth'
gem 'rack-cors'
gem 'omniauth'
gem 'active_model_serializers'
gem 'native_enum'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :test do
  gem 'rails-controller-testing', '1.0.4'
  gem 'minitest', '5.11.3'
  gem 'minitest-reporters', '1.3.8'
  gem 'guard'
  gem 'guard-minitest'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
