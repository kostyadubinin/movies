module ApplicationHelper
  def poster_url(movie, size: 'w342')
    "#{configuration.base_url}#{size}#{movie.poster_path}"
  end

  def youtube_url(source)
    "//www.youtube.com/embed/#{source}"
  end

  private

  # TODO: Cache this. From the documentation:
  #
  #   It is recommended you cache this data within your application
  #   and check for updates every few days.
  #
  def configuration
    @configuration ||= Tmdb::Configuration.new
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
