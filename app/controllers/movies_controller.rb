class MoviesController < ApplicationController
  # TODO: Validate `params[:page]`.
  def index
    @movies = MovieDecorator.decorate_collection(
      Movie.order(params[:order]).page(params[:page])
    )
  end
end
