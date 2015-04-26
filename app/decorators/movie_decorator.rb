class MovieDecorator < Draper::Decorator
  delegate_all

  # TODO: Use TMDb Configuration.
  POSTER_SIZE = 342
  BASE_URL = "http://image.tmdb.org/t/p/"

  def poster_url
    "#{BASE_URL}w#{POSTER_SIZE}#{object.poster_path}"
  end

  def poster_width
    POSTER_SIZE
  end
end
