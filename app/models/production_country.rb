class ProductionCountry
  pattr_initialize :attributes

  def to_h
    attributes
  end

  def iso_3166_1
    attributes["iso_3166_1"]
  end

  def name
    attributes["name"]
  end
end
