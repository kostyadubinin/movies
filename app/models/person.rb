class Person
  def self.popular
    response = $tmdb.get "person/popular"
    response.body["results"]
  end

  def self.find(id)
    response = $tmdb.get "person/#{id}"
    response.body
  end
end
