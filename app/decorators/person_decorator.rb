class PersonDecorator < Draper::Decorator
  delegate_all

  def profile_url(size: 'w300')
    "#{h.configuration.base_url}#{size}#{profile_path}"
  end
end
