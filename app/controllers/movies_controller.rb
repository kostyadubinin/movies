class MoviesController < ApplicationController
  # TODO: validate params[:page]
  def index
    @movies = MovieDecorator.decorate_collection(
      Movie.order(params[:order]).page(params[:page])
    )
  end
end
