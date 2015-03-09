class Movie
  def self.get(criteria)
    $tmdb.get "movie/#{criteria[:type]}", criteria.except(:type)
  end

  def self.popular
    Criteria.new(self).type("popular")
  end

  def self.top_rated
    Criteria.new(self).type("top_rated")
  end

  def self.now_playing
    Criteria.new(self).type("now_playing")
  end

  def self.upcoming
    Criteria.new(self).type("upcoming")
  end

  def self.find(id)
    Criteria.new(self).type(id).append_to_response("trailers,credits")
  end

  def self.page(page)
    Criteria.new(self).page(page)
  end
end
