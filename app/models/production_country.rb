class ProductionCountry
  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def iso_3166_1
    attributes["iso_3166_1"]
  end

  def name
    attributes["name"]
  end
end
