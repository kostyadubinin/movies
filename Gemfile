source "https://rubygems.org"

ruby "2.2.0"

gem "active_link_to"
gem "autoprefixer-rails"
gem "bootstrap-sass"
gem "bootswatch-rails"
gem "coffee-rails", "~> 4.0.0"
gem "draper"
gem "faraday"
gem "faraday_middleware"
gem "figaro"
gem "font-awesome-sass"
gem "haml-rails"
gem "jbuilder", "~> 2.0"
gem "jquery-rails"
gem "kaminari"
gem "omniauth-facebook"
gem "rails", "4.2.1"
gem "sass-rails", "~> 4.0.3"
gem "sdoc", "~> 0.4.0", group: :doc
gem "turbolinks"
gem "uglifier", ">= 1.3.0"
gem "web-console", "~> 2.0", group: :development

group :production do
  gem "pg"
  gem "rails_12factor"
end

group :development do
  gem "quiet_assets"
  gem "spring"
end

group :development, :test do
  gem "jazz_hands", github: "nixme/jazz_hands", branch: "bring-your-own-debugger"
  gem "pry-byebug"
  gem "rspec-rails"
  gem "sqlite3"
end

group :test do
  gem "codeclimate-test-reporter", group: :test, require: nil
  gem "vcr"
  gem "webmock"
end
