source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.1.4'

# default gems
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'spring', group: :development

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
end

gem 'haml-rails'

# css
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'bootswatch-rails'
gem 'font-awesome-sass'

# themoviedb api
gem 'themoviedb'

gem 'figaro'

# tests
group :development, :test do
  gem 'rspec-rails'
end

# tools
group :development do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
end
