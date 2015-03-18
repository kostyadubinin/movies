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

  def title
    body["title"]
  end

  def genres
    body["genres"].map { |g| Genre.new(g) }
  end
end
