class MovieDecorator < Draper::Decorator
  delegate_all

  # TODO: Use TMDb Configuration.
  def poster_url
    base_url = "http://image.tmdb.org/t/p/"
    size = "w342"

    "#{base_url}#{size}#{object.poster_path}"
  end
end
