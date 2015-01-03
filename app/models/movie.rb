class Movie
  class << self
    delegate :popular, :top_rated, :now_playing, :upcoming, to: Tmdb::Movie

    def find(*params)
      # TODO: Handle invalid ids.
      Tmdb::Movie.detail(*params)
    end
  end
end
