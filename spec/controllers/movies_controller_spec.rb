require "rails_helper"

describe MoviesController do
  describe "GET popular" do
    it "assigns @movies" do
      VCR.use_cassette("movies_popular", match_requests_on: [VCR.request_matchers.uri_without_param(:api_key)]) do
        get :popular
      end

      expect(assigns(:movies)).not_to be_empty
    end
  end
end
