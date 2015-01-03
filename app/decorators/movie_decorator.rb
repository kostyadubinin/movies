class MovieDecorator < Draper::Decorator
  delegate_all

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
end
