module ApplicationHelper
  def poster_url(movie, size: 'w342')
    configuration.base_url + size.to_s + movie.poster_path
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
end
