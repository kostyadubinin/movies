class MovieCollection
  extend Forwardable

  def_delegator :movies, :respond_to?

  def initialize(body)
    @body = body
  end

  def current_page
    body["page"]
  end

  def total_pages
    body["total_pages"]
  end

  def total_results
    body["total_results"]
  end

  private

  def method_missing(m, *args, &block)
    movies.public_send(m, *args, &block)
  end

  attr_reader :body

  def movies
    @movies ||= body["results"].map { |movie_attrs| Movie.new(movie_attrs) }
  end
end
