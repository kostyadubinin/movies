class GenreDecorator < Draper::Decorator
  def id
    object["id"]
  end

  def name
    object["name"]
  end
end
