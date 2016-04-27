class Tour
  attr_reader :cities, :distance

  def initialize(cities)
    @cities = cities
  end

  def distance
    (0..cities.length - 1).reduce(0) do |sum, i|
      sum + City.distance(cities[i], cities[i-1])
    end
  end
end
