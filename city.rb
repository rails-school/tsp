class City
  def initialize(x, y)
    @complex = Complex(x, y)
  end

  attr_reader :complex

  def self.distance(city_a, city_b)
    (city_a.complex - city_b.complex).abs
  end
end
