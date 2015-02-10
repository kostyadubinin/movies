class MovieDecorator < Draper::Decorator
  def id
    handle_none object["id"] do
      object["id"]
    end
  end

  def title
    handle_none object["title"] do
      object["title"]
    end
  end

  def overview
    handle_none object["overview"] do
      object["overview"]
    end
  end

  def tagline
    handle_none object["tagline"] do
      object["tagline"]
    end
  end

  def belongs_to_collection
    handle_none object["belongs_to_collection"] do
      CollectionDecorator.decorate(object["belongs_to_collection"])
    end
  end

  def genres
    GenreDecorator.decorate_collection(object["genres"])
  end

  def release_date
    handle_none object["release_date"] do
      Time.parse(object["release_date"]).strftime("%B %Y")
    end
  end

  def budget
    handle_none object["budget"] do
      h.number_to_currency(object["budget"], precision: 0)
    end
  end

  def runtime
    handle_none object["runtime"] do
      object["runtime"]
    end
  end

  def vote_average
    handle_none object["vote_average"] do
      object["vote_average"]
    end
  end

  def poster_url(size: 'w342')
    if object["poster_path"]
      "#{h.configuration.base_url}#{size}#{object["poster_path"]}"
    else
      "http://dummyimage.com/342x513/d9d9d9/000000.png&text=N/A"
    end
  end

  def youtube_trailers
    TrailerDecorator.decorate_collection(object["trailers"]["youtube"])
  end

  private

  def handle_none(value)
    if value.present? && value != 0
      yield
    else
      nil
    end
  end
end
