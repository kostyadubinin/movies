class MovieDecorator < Draper::Decorator
  delegate_all

  # TODO: Use TMDb Configuration.
  POSTER_SIZE = 342
  BASE_URL = "http://image.tmdb.org/t/p/"

  def poster_url
    if object.poster_path
      "#{BASE_URL}w#{POSTER_SIZE}#{object.poster_path}"
    else
      "http://placehold.it/#{poster_size}?text=#{object.title}"
    end
  end

  def poster_width
    POSTER_SIZE
  end

  # Use in caution.
  def poster_height
    (poster_width * 1.5).to_i
  end

  # Use in caution.
  def poster_size
    "#{poster_width}x#{poster_height}"
  end
end
