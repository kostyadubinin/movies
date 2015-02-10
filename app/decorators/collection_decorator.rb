class CollectionDecorator < Draper::Decorator
  def id
    object["id"]
  end

  def name
    object["name"]
  end

  def poster_path
    object["poster_path"]
  end

  def backdrop_path
    object["backdrop_path"]
  end
end
