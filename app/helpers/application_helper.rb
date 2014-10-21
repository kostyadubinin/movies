module ApplicationHelper
  def poster_url(movie)
    poster_size = 'w342'
    configuration.base_url + poster_size + movie.poster_path
  end

  def backdrop_url(movie)
    backdrop_size = 'w1280'
    configuration.base_url + backdrop_size + movie.backdrop_path
  end

  def imdb_url(imdb_id)
    "http://www.imdb.com/title/#{imdb_id}/"
  end

  private

  # TODO: Cache this. From the documentation:
  #
  #   It is recommended you cache this data within your application
  #   and check for updates every few days.
  #
  def configuration
    @configuration ||= Tmdb::Configuration.new
  end
end
