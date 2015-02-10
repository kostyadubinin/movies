class TrailerDecorator < Draper::Decorator
  def name
    object["name"]
  end

  def size
    object["size"]
  end

  def source
    object["source"]
  end

  def type
    object["type"]
  end
end
