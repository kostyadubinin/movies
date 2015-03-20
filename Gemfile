source 'https://rubygems.org'

ruby '2.1.5'
gem 'rails', '4.2.1'

# default gems
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'spring', group: :development
gem 'web-console', '~> 2.0', group: :development

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
end

gem 'haml-rails'

# auth
gem 'omniauth-facebook'

# css
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'bootswatch-rails'
gem 'font-awesome-sass'

gem 'kaminari'
gem "faraday"
gem "faraday_middleware"
gem 'draper'
gem 'active_link_to'
gem 'figaro'

# tests
group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem "codeclimate-test-reporter", group: :test, require: nil
end

# tools
group :development do
  gem 'quiet_assets'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
end
