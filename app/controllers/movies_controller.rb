class MoviesController < ApplicationController
  def index
    @movies = MovieDecorator.decorate_collection(
      case params[:order]
      when "top_rated"   then Movie.top_rated
      when "upcoming"    then Movie.upcoming
      when "now_playing" then Movie.now_playing
      else Movie.popular
      end
    )
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
