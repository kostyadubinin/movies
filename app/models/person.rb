class Person
  class << self
    delegate :latest, :popular, to: Tmdb::Person

    def find(*params)
      # TODO: Handle invalid ids.
      Tmdb::Person.detail(*params)
    end
  end
end
