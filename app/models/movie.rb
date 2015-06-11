class Movie
  pattr_initialize :attributes

  # TODO: add tests
  def self.order(order)
    return Movie.popular if order.nil?

    case order.to_s
    when "popular"     then Movie.popular
    when "top_rated"   then Movie.top_rated
    when "upcoming"    then Movie.upcoming
    when "now_playing" then Movie.now_playing
    else
      fail "Movies cannot be ordered by #{order}"
    end
  end

  def self.popular
    Criteria.new("movie/popular")
  end

  def self.upcoming
    Criteria.new("movie/upcoming")
  end

  def self.now_playing
    Criteria.new("movie/now_playing")
  end

  def self.top_rated
    Criteria.new("movie/top_rated")
  end

  def self.latest
    response = $tmdb.get "movie/latest"
    new(response.body)
  end

  def self.find(id)
    response = $tmdb.get "movie/#{id}"
    new(response.body)
  end

  def to_h
    attributes
  end

  def adult?
    attributes["adult"]
  end

  def backdrop_path
    attributes["backdrop_path"]
  end

  def collection
    if attributes["belongs_to_collection"].present?
      Collection.new(attributes["belongs_to_collection"])
    end
  end

  def budget
    return nil if attributes["budget"] == 0
    attributes["budget"]
  end

  def genres
    attributes["genres"].map { |g| Genre.new(g) }
  end

  def homepage
    attributes["homepage"]
  end

  def id
    attributes["id"]
  end

  def imdb_id
    attributes["imdb_id"]
  end

  def original_language
    attributes["original_language"]
  end

  def original_title
    attributes["original_title"]
  end

  def overview
    attributes["overview"]
  end

  def popularity
    return nil if attributes["popularity"] == 0
    attributes["popularity"]
  end

  def poster_path
    attributes["poster_path"]
  end

  def production_companies
    attributes["production_companies"].map { |pc| ProductionCompany.new(pc) }
  end

  def production_countries
    attributes["production_countries"].map { |pc| ProductionCountry.new(pc) }
  end

  def status
    attributes["status"]
  end

  def tagline
    attributes["tagline"]
  end

  def title
    attributes["title"]
  end

  def video?
    attributes["video"]
  end

  def vote_average
    return nil if attributes["vote_average"] == 0.0
    attributes["vote_average"]
  end

  def vote_count
    attributes["vote_count"]
  end
end
