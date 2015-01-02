module ApplicationHelper
  def poster_url(movie, size: 'w342')
    if movie.poster_path
      "#{configuration.base_url}#{size}#{movie.poster_path}"
    else
      "http://dummyimage.com/342x513/d9d9d9/000000.png&text=N/A"
    end
  end

  def profile_path(person, size: 'w300')
    "#{configuration.base_url}#{size}#{person.profile_path}"
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
