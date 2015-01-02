class PeopleController < ApplicationController
  def index
    @people = Tmdb::Person.popular
  end

  def show
    @person = Tmdb::Person.detail(params[:id], append_to_response: 'movie_credits') || []
  end
end
