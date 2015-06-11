class MoviesController < ApplicationController
  # TODO: validate params[:page]
  def index
    @movies = MovieDecorator.decorate_collection(
      movies(order: params[:order]).page(params[:page])
    )
  end

  private

  def movies(order:)
    case order
    when nil           then Movie.popular
    when "top_rated"   then Movie.top_rated
    when "upcoming"    then Movie.upcoming
    when "now_playing" then Movie.now_playing
    end
  end
end
