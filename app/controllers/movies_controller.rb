class MoviesController < ApplicationController
  def popular
    prepare_movies { Movie.popular(page: params.fetch(:page, 1)) }
  end

  def top_rated
    prepare_movies { Movie.top_rated(page: params.fetch(:page, 1)) }
  end

  def now_playing
    prepare_movies { Movie.now_playing(page: params.fetch(:page, 1)) }
  end

  def upcoming
    prepare_movies { Movie.upcoming(page: params.fetch(:page, 1)) }
  end

  def show
    @movie = MovieDecorator.decorate(Movie.find(params[:id]))
  end

  private

  def prepare_movies
    body = yield

    movies = MovieDecorator.decorate_collection(body["results"])
    @movies = Kaminari.
      paginate_array(movies, total_count: body["total_results"]).
      page(params[:page]).per(20)

    render 'index'
  end
end
