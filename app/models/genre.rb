class Genre
  pattr_initialize :attributes

  def id
    attributes["id"]
  end

  def name
    attributes["name"]
  end
end
