class MoviesController < ApplicationController
  def index
    @movies = MovieDecorator.decorate_collection(
      case params[:order]
      when nil           then Movie.popular
      when "top_rated"   then Movie.top_rated
      when "upcoming"    then Movie.upcoming
      when "now_playing" then Movie.now_playing
      end
    )
  end
end
