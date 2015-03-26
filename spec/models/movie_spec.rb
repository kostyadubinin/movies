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
    let(:collection_attrs) {
      { "id"            => 121938,
        "name"          => "The Hobbit Collection",
        "poster_path"   => "/hQghXOjSS2xfzx9XnMyZqt8brCF.jpg",
        "backdrop_path" => "/7wO7MSnP5UcwR2cTHdJFF1vP4Ie.jpg" }
    }

    it "returns collection object if the movie belongs to a collection" do
      movie_attributes["belongs_to_collection"] = collection_attrs
      expect(movie.belongs_to_collection).to be_an_instance_of(Collection)
    end
  end

  describe "#budget" do
    it "returns nil instead of 0" do
      movie_attributes["budget"] = 0
      expect(movie.budget).to be_nil
    end
  end

  it "has genres" do
    movie_attributes["genres"] = [{ "id" => 7, "name" => "Western" }]
    expect(movie.genres).to all(be_an_instance_of(Genre))
  end

  it "has a homepage" do
    movie_attributes["homepage"] = "http://www.thehobbit.com/"
    expect(movie.homepage).to eq("http://www.thehobbit.com/")
  end

  it "has an ID" do
    movie_attributes["id"] = 550
    expect(movie.id).to eq(550)
  end

  it "has an IMDb ID" do
    movie_attributes["imdb_id"] = 777
    expect(movie.imdb_id).to eq(777)
  end

  it "has an original language" do
    movie_attributes["original_language"] = "eu"
    expect(movie.original_language).to eq("eu")
  end

  it "has an original title" do
    movie_attributes["original_title"] = "Dracula"
    expect(movie.original_title).to eq("Dracula")
  end

  it "has an overview" do
    movie_attributes["overview"] = "Dracula"
    expect(movie.overview).to eq("Dracula")
  end

  it "has a title" do
    movie_attributes["title"] = "Dracula"
    expect(movie.title).to eq("Dracula")
  end
end
