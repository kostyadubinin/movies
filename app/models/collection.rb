class Collection
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def name
    attributes["name"]
  end

  def id
    attributes["id"]
  end

  def poster_path
    attributes["poster_path"]
  end

  def backdrop_path
    attributes["backdrop_path"]
  end
end
