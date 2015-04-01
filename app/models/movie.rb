class Movie
  attr_reader :body

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

  def title
    body["title"]
  end

  def popularity
    body["popularity"]
  end
end
