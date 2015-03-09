class MoviesController < ApplicationController
  def index
    movies =
      case params[:o]
      when "popular"      then Movie.popular.page(params[:page])
      when "top_rated"    then Movie.top_rated.page(params[:page])
      when "now_playing"  then Movie.now_playing.page(params[:page])
      when "upcoming"     then Movie.upcoming.page(params[:page])
      else
        redirect_to movies_path(o: :popular) and return
      end

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
      paginate_array(movies, total_count: total_count(body["total_results"])).
      page(params[:page]).per(20)

    render 'index'
  end

  def total_count(total_results)
    total_results > 1000 * 20 ? 1000 * 20 : total_results
  end
end
