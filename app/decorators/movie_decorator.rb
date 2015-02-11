class MovieDecorator < Draper::Decorator
  def id
    object["id"]
  end

  def title
    object["title"]
  end

  def overview
    object["overview"]
  end

  def tagline
    object["tagline"]
  end

  def poster_path
    object["poster_path"]
  end

  def genres
    GenreDecorator.decorate_collection(object["genres"])
  end

  def youtube_trailers
    if object["trailers"].try(:[], "youtube")
      TrailerDecorator.decorate_collection(object["trailers"]["youtube"])
    end
  end

  def belongs_to_collection
    if object["belongs_to_collection"].present?
      CollectionDecorator.decorate(object["belongs_to_collection"])
    end
  end

  def release_date
    if object["release_date"].present?
      Time.parse(object["release_date"]).strftime("%B %Y")
    end
  end

  def budget
    unless object["budget"].to_i.zero?
      h.number_to_currency(object["budget"], precision: 0)
    end
  end

  def runtime
    unless object["runtime"].to_i.zero?
      object["runtime"]
    end
  end

  def vote_average
    unless object["vote_average"].to_f.zero?
      object["vote_average"]
    end
  end

  def poster_url(size: "w342")
    if poster_path.present?
      "#{h.configuration.base_url}#{size}#{poster_path}"
    else
      "http://dummyimage.com/342x513/d9d9d9/000000.png&text=N/A"
    end
  end
end
