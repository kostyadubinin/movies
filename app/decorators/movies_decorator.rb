class MoviesDecorator < Draper::CollectionDecorator
  delegate :page, :total_pages, :total_results
end
