class Movie
  attr_reader :body

  def self.latest
    response = $tmdb.get "movie/latest"
    new(response.body)
  end

  def self.find(id)
    response = $tmdb.get "movie/#{id}"
    new(response.body)
  end

  def initialize(body)
    @body = body
  end

  # TODO: Consider add a trailing ?
  def adult
    body["adult"]
  end

  def backdrop_path
    body["backdrop_path"]
  end

  # TODO: Consider renaming to just collection
  def belongs_to_collection
    if body["belongs_to_collection"].present?
      Collection.new(body["belongs_to_collection"])
    end
  end

  def budget
    return nil if body["budget"] == 0
    body["budget"]
  end

  def genres
    body["genres"].map { |g| Genre.new(g) }
  end

  def homepage
    body["homepage"]
  end

  def id
    body["id"]
  end

  def imdb_id
    body["imdb_id"]
  end

  def original_language
    body["original_language"]
  end

  def original_title
    body["original_title"]
  end

  def overview
    body["overview"]
  end

  def popularity
    return nil if body["popularity"] == 0
    body["popularity"]
  end

  def poster_path
    body["poster_path"]
  end

  def production_companies
    body["production_companies"].map { |pc| ProductionCompany.new(pc) }
  end

  def production_countries
    body["production_countries"].map { |pc| ProductionCountry.new(pc) }
  end

  def status
    body["status"]
  end

  def tagline
    body["tagline"]
  end

  def title
    body["title"]
  end

  def video
    body["video"]
  end

  def vote_average
    return nil if body["vote_average"] == 0.0
    body["vote_average"]
  end

  def vote_count
    body["vote_count"]
  end
end
