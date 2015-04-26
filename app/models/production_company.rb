class ProductionCompany
  pattr_initialize :attributes

  def to_h
    attributes
  end

  def id
    attributes["id"]
  end

  def name
    attributes["name"]
  end
end
