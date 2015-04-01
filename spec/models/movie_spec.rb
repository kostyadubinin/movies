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

    it "returns collection object" do
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

  describe "#popularity" do
    it "returns popularity of the movie" do
      movie_attributes["popularity"] = 2.50307202280779
      expect(movie.popularity).to eq(2.50307202280779)
    end

    it "returns nil instead of 0.0" do
      movie_attributes["popularity"] = 0.0
      expect(movie.popularity).to eq(nil)
    end
  end

  it "has a poster path" do
    movie_attributes["poster_path"] = "/poster.png"
    expect(movie.poster_path).to eq("/poster.png")
  end

  describe "production_companies" do
    it "returns an array of ProductionCompany objects" do
      movie_attributes["production_companies"] = [
        { "name" => "20th Century Fox",  "id" => 25 },
        { "name" => "Fox 2000 Pictures", "id" => 711 }
      ]

      expect(movie.production_companies).to all(
        be_an_instance_of(ProductionCompany)
      )
    end
  end

  describe "production_countries" do
    it "returns an array of ProductionCountry objects" do
      movie_attributes["production_countries"] = [
        {"iso_3166_1" => "DE", "name" => "Germany"},
        {"iso_3166_1" => "US", "name" => "United States of America"}
      ]

      expect(movie.production_countries).to all(
        be_an_instance_of(ProductionCountry)
      )
    end
  end

  it "has a status" do
    movie_attributes["status"] = "Released"
    expect(movie.status).to eq("Released")
  end

  it "has a tagline" do
    movie_attributes["tagline"] = "Fire burns brighter in the darkness."
    expect(movie.tagline).to eq("Fire burns brighter in the darkness.")
  end

  it "has a title" do
    movie_attributes["title"] = "Dracula"
    expect(movie.title).to eq("Dracula")
  end

  it "has a video flag" do
    movie_attributes["video"] = true
    expect(movie.video).to be_truthy
  end

  describe "#vote_average" do
    it "returns vote average for the movie" do
      movie_attributes["vote_average"] = 7.7
      expect(movie.vote_average).to eq(7.7)
    end

    it "returns nil instead of 0.0" do
      movie_attributes["vote_average"] = 0.0
      expect(movie.vote_average).to eq(nil)
    end
  end

  it "has a vote count" do
    movie_attributes["vote_count"] = 3185
    expect(movie.vote_count).to eq(3185)
  end

  describe ".latest" do
    let(:latest_movie_attributes) { $tmdb.get("movie/latest").body }
    subject(:latest_movie) { Movie.latest }

    it "returns a Movie object" do
      expect(latest_movie).to be_an_instance_of(Movie)
    end

    it "returns the latest movie" do
      expect(latest_movie.id).to eq(latest_movie_attributes["id"])
    end
  end
end
