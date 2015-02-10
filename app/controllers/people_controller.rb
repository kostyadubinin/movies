class PeopleController < ApplicationController
  def index
    @people = PersonDecorator.decorate_collection(Person.popular)
  end

  def show
    @person = PersonDecorator.decorate(Person.find(params[:id]))
  end
end
