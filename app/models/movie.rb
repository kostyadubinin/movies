class Movie
  def self.popular
    response = $tmdb.get "movie/popular"
    response.body["results"]
  end

  def self.top_rated
    response = $tmdb.get "movie/top_rated"
    response.body["results"]
  end

  def self.now_playing
    response = $tmdb.get "movie/now_playing"
    response.body["results"]
  end

  def self.upcoming
    response = $tmdb.get "movie/upcoming"
    response.body["results"]
  end

  def self.find(id)
    response = $tmdb.get "movie/#{id}", append_to_response: 'trailers,credits'
    response.body
  end
end
