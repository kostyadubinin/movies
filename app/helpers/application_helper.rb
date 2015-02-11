module ApplicationHelper
  def youtube_url(source)
    "//www.youtube.com/embed/#{source}"
  end

  # TODO: Cache this. From the documentation:
  #
  #   It is recommended you cache this data within your application
  #   and check for updates every few days.
  #
  def configuration
    Rails.cache.fetch("tmdb/configuration", expires_in: 1.day) do
      ConfigurationDecorator.decorate($tmdb.get('configuration').body)
    end
  end

  def flash_class(level)
    case level
    when 'success' then 'alert alert-success'
    when 'info'    then 'alert alert-info'
    when 'warning' then 'alert alert-warning'
    when 'danger'  then 'alert alert-danger'
    end
  end
end
