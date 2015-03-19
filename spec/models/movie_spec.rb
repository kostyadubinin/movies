require "rails_helper"

describe Movie, :vcr do
  let(:movie_attributes) { $tmdb.get("movie/550").body }
  subject(:movie) { Movie.new(movie_attributes) }

  it "has adult flag" do
    movie_attributes["adult"] = true
    expect(movie.adult).to be_truthy
  end

  it "has a backdrop path" do
    movie_attributes["backdrop_path"] = "/backdrop.png"
    expect(movie.backdrop_path).to eq("/backdrop.png")
  end

  describe "#belongs_to_collection" do
    it "returns nil if the movie doesn't belong to a collection" do
      movie_attributes["belongs_to_collection"] = nil
      expect(movie.belongs_to_collection).to be_nil
    end

    it "returns collection object if the movie belongs to a collection" do
      movie_attributes["belongs_to_collection"] = {
        "id"            => 121938,
        "name"          => "The Hobbit Collection",
        "poster_path"   => "/hQghXOjSS2xfzx9XnMyZqt8brCF.jpg",
        "backdrop_path" => "/7wO7MSnP5UcwR2cTHdJFF1vP4Ie.jpg"
      }

      expect(movie.belongs_to_collection).to be_an_instance_of(Collection)
    end
  end

  it "has a title" do
    movie_attributes["title"] = "Dracula"
    expect(movie.title).to eq("Dracula")
  end

  it "has genres" do
    movie_attributes["genres"] = [{ "id" => 7, "name" => "Western" }]
    expect(movie.genres).to all(be_an_instance_of(Genre))
  end
end
