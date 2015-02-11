class MoviesController < ApplicationController
  def popular
    @movies = MovieDecorator.decorate_collection(Movie.popular)
    render 'index'
  end

  def top_rated
    @movies = MovieDecorator.decorate_collection(Movie.top_rated)
    render 'index'
  end

  def now_playing
    @movies = MovieDecorator.decorate_collection(Movie.now_playing)
    render 'index'
  end

  def upcoming
    @movies = MovieDecorator.decorate_collection(Movie.upcoming)
    render 'index'
  end

  def show
    @movie = MovieDecorator.decorate(Movie.find(params[:id]))
  end
end
