class Genre
  attr_reader :body

  def initialize(body)
    @body = body
  end

  def id
    body["id"]
  end
end
