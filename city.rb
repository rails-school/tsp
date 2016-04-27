class City
  def initialize(x, y)
    @complex = Complex(x, y)
  end

  attr_reader :complex

  def to_s
    complex.to_s
  end

  def self.distance(city_a, city_b)
    @memo = Hash.new do |key, value|
      key = (city_a.complex - city_b.complex).abs
    end
    @memo[[city_a, city_b].sort_by(&:object_id)]
  end

  def self.random_cities(n)
    n.times.map {
      City.new(rand(10..890), rand(10..590))
    }
  end
end
