class WelcomeController < ApplicationController
  def index
    @movies = Tmdb::Movie.popular
  end
end
