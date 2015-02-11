class PersonDecorator < Draper::Decorator
  def id
    object["id"]
  end

  def name
    object["name"]
  end

  def adult
    object["adult"]
  end

  def popularity
    object["popularity"]
  end

  def profile_path
    object["profile_path"]
  end

  # def known_for
  #   object["known_for"]
  # end

  def profile_url(size: 'w300')
    "#{h.configuration.base_url}#{size}#{object["profile_path"]}"
  end
end
