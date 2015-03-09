class MoviesController < ApplicationController
  def index
    movies =
      case params[:o]
      when "popular"      then Movie.popular.page(params[:page])
      when "top_rated"    then Movie.top_rated.page(params[:page])
      when "now_playing"  then Movie.now_playing.page(params[:page])
      when "upcoming"     then Movie.upcoming.page(params[:page])
      end

    movies ||= Movie.popular.page(params[:page])
    prepare_movies { movies }
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
      paginate_array(movies, total_count: 1000 * 20).
      page(params[:page]).per(20)

    render 'index'
  end
end
