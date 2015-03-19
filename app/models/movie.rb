class Movie
  attr_reader :body

  def popular
  end

  def self.find(id)
    response = $tmdb.get "movie/#{id}"
    new(response.body)
  end

  def initialize(body)
    @body = body
  end

  # Returns false or true.
  def adult
    body["adult"]
  end

  # Returns nonempty String or nil.
  def backdrop_path
    body["backdrop_path"]
  end

  # Returns Hash or nil.
  def belongs_to_collection
    if body["belongs_to_collection"].present?
      Collection.new(body["belongs_to_collection"])
    end
  end

  # Returns String.
  def title
    body["title"]
  end

  # Returns Array of Hashes or empty Array.
  def genres
    body["genres"].map { |g| Genre.new(g) }
  end
end
