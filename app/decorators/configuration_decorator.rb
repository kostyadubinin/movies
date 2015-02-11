class ConfigurationDecorator < Draper::Decorator
  def base_url
    object["images"]["base_url"]
  end
end
