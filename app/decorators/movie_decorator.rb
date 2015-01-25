class MovieDecorator < Draper::Decorator
  delegate_all

  def release_date
    handle_none object.release_date do
      Time.parse(object.release_date).strftime("%B %Y")
    end
  end

  def budget
    handle_none object.budget do
      h.number_to_currency(object.budget, precision: 0)
    end
  end

  def runtime
    handle_none object.runtime do
      object.runtime
    end
  end

  def vote_average
    handle_none object.vote_average do
      object.vote_average
    end
  end

  def cast
    CastDecorator.decorate_collection(credits.cast)
  end

  def cast_head
    cast[0..4]
  end

  def cast_tail
    cast - cast_head
  end

  def crew
    crew = CrewDecorator.decorate_collection(credits.crew)
    crew = crew.group_by { |m| m.department }
    test = crew.each do |department, members|
      crew[department] = members.group_by { |m| m.job }
    end

    test
  end

  def crew_head
    crew.select { |department, _| department == 'Directing' }
  end

  def crew_tail
    crew.select { |department, _| department != 'Directing' }
  end

  def poster_url(size: 'w342')
    if poster_path
      "#{h.configuration.base_url}#{size}#{poster_path}"
    else
      "http://dummyimage.com/342x513/d9d9d9/000000.png&text=N/A"
    end
  end

  def trailers
    object.trailers.youtube[0...2]
  end

  private

  def handle_none(value)
    if value.present? && value != 0
      yield
    else
      nil
    end
  end
end
