class Criteria
  extend Forwardable

  def_delegator :movies, :respond_to?

  def initialize(path)
    @path = path
  end

  def page(page_number)
    @page_number = page_number
    self
  end

  private

  attr_reader :path, :page_number

  def method_missing(m, *args, &block)
    movies.public_send(m, *args, &block)
  end

  def movies
    return movies if @movies && @movies.current_page == page_number
    @movies = fetch_movies
  end

  def fetch_movies
    response = $tmdb.get path, page: page_number || 1
    MovieCollection.new(response.body)
  end
end
