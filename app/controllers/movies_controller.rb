class MoviesController < ApplicationController
  def index
    @movies = Tmdb::Movie.popular || []
  end

  def show
    @movie = Tmdb::Movie.detail(params[:id], append_to_response: 'trailers')
  end
end
