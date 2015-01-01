class MoviesController < ApplicationController
  def popular
    @movies = Tmdb::Movie.popular || []
    render 'index'
  end

  def top_rated
    @movies = Tmdb::Movie.top_rated || []
    render 'index'
  end

  def now_playing
    @movies = Tmdb::Movie.now_playing || []
    render 'index'
  end

  def upcoming
    @movies = Tmdb::Movie.upcoming || []
    render 'index'
  end

  def show
    # TODO: Handle invalid ids.
    @movie = Tmdb::Movie.detail(params[:id], append_to_response: 'trailers,credits')
  end
end
