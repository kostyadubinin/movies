class MoviesController < ApplicationController
  def index
    @movies = Movie.popular
  end

  def show
    response = Movie.find(params[:id]).response
    @movie = MovieDecorator.decorate(response.body)
  end

  private

  def prepare_movies
    body = yield.response.body

    movies = MovieDecorator.decorate_collection(body["results"])
    @movies = Kaminari.
      paginate_array(movies, total_count: total_count(body["total_results"])).
      page(params[:page]).per(20)

    render 'index'
  end

  def total_count(total_results)
    total_results > 1000 * 20 ? 1000 * 20 : total_results
  end
end
