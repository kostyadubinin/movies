class Movie
  def self.popular(page: 1)
    response = $tmdb.get "movie/popular", page: page
    response.body
  end

  def self.top_rated(page: 1)
    response = $tmdb.get "movie/top_rated", page: page
    response.body
  end

  def self.now_playing(page: 1)
    response = $tmdb.get "movie/now_playing", page: page
    response.body
  end

  def self.upcoming(page: 1)
    response = $tmdb.get "movie/upcoming", page: page
    response.body
  end

  def self.find(id)
    response = $tmdb.get "movie/#{id}", append_to_response: "trailers,credits"
    response.body
  end

  def self.latest
    response = $tmdb.get "movie/latest", append_to_response: "trailers,credits"
    response.body
  end
end
