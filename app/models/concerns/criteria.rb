class Criteria
  attr_reader :klass

  def initialize(klass)
    @klass = klass
  end

  def criteria
    @criteria ||= {}
  end

  def type(type)
    criteria[:type] = type
    self
  end

  def append_to_response(fields)
    criteria[:append_to_response] = fields
    self
  end

  def page(page)
    criteria[:page] = page if page.present?
    self
  end

  def response
    @response ||= klass.get(criteria)
  end
end
