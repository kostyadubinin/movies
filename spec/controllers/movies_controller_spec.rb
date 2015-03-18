require "rails_helper"

describe MoviesController do
  describe "GET index" do
    it "redirect to popular" do
      get :index
      expect(response).to redirect_to(movies_url(o: :popular))
    end

    it "assings @movies" do
      VCR.use_cassette("movies_popular") do
        get :index, o: :popular
      end
      expect(assigns(:movies)).not_to be_empty
    end
  end
end
