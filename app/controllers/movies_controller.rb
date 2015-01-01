class MoviesController < ApplicationController
  def index
    @movies = Tmdb::Movie.popular || []
  end

  def show
    # TODO: Handle invalid ids.
    @movie = Tmdb::Movie.detail(params[:id], append_to_response: 'trailers,credits')
  end
end
