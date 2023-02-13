class Triangle
  # write code here
    attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    raise TriangleError, 'Invalid triangle' if invalid?
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  private

  def invalid?
    sides.any? { |side| side <= 0 } || violates_triangle_inequality?
  end

  def sides
    [a, b, c]
  end

  def violates_triangle_inequality?
    sides.sort[0..1].sum <= sides.sort[2]
  end

  class TriangleError < StandardError
  end

end
