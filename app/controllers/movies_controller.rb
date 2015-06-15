class MoviesController < ApplicationController
  # TODO: Validate `params[:page]`.
  def index
    movies = MovieDecorator.decorate_collection(
      Movie.order(params[:order]).page(params[:page])
    )

    @movies = paginate(movies, page: params[:page])
  end

  private

  def paginate(movies, page:)
    Kaminari.paginate_array(
      movies, total_count: movies.total_paginatable_results
    ).page(page)
  end
end
