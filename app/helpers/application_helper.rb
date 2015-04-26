module ApplicationHelper
  # Responsive column resets for Bootstrap. See:
  # http://getbootstrap.com/css/#grid
  #
  # index        - column number
  # columns_spec - number of columns per grid tier, i.g { xs: 2, sm: 3 }
  #
  # Examples
  #
  #   responsive_columns_fix(4, xs: 2, sm: 3, md: 4, lg: 6)
  #   # => "<div class=\"clearfix visible-xs-block visible-md-block\"></div>"
  #
  #   responsive_columns_fix(1, xs: 2, sm: 3, md: 4, lg: 6)
  #   # => nil
  #
  def responsive_columns_fix(index, columns_spec)
    tiers = columns_spec.map { |tier, width| index % width == 0 ? tier : nil }
    tiers = tiers.compact.map { |tier| "visible-#{tier}-block" }

    content_tag(:div, nil, class: "clearfix #{tiers.join(' ')}") if tiers.any?
  end

  def youtube_url(source)
    "//www.youtube.com/embed/#{source}"
  end

  def flash_class(level)
    case level
    when "success" then "alert alert-success"
    when "info"    then "alert alert-info"
    when "warning" then "alert alert-warning"
    when "danger"  then "alert alert-danger"
    end
  end
end
