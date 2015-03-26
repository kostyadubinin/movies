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

  def title
    body["title"]
  end
end
