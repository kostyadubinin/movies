class MoviesController < ApplicationController
  def popular
    @movies = Movie.popular
    render 'index'
  end

  def top_rated
    @movies = Movie.top_rated
    render 'index'
  end

  def now_playing
    @movies = Movie.now_playing
    render 'index'
  end

  def upcoming
    @movies = Movie.upcoming
    render 'index'
  end

  def show
    @movie = Movie.find(params[:id], append_to_response: 'trailers,credits')
  end
end
