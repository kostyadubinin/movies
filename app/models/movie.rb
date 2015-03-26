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

  def adult
    body["adult"]
  end

  def backdrop_path
    body["backdrop_path"]
  end

  def belongs_to_collection
    if body["belongs_to_collection"].present?
      Collection.new(body["belongs_to_collection"])
    end
  end

  def title
    body["title"]
  end

  def genres
    body["genres"].map { |g| Genre.new(g) }
  end
end
