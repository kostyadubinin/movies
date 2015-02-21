require "rails_helper"

describe MoviesController do
  describe "GET popular" do
    it "assigns @movies" do
      VCR.use_cassette("movies_popular") do
        get :popular
      end

      expect(assigns(:movies)).not_to be_empty
    end
  end
end
