require "pry"
require "./city.rb"
require "./tour.rb"

srand

cities8, cities10, cities100, cities1000 =
  [8, 10, 100, 1000].map { |n|
    City.random_cities(n)
  }

def all_tours(cities)
  cities.permutation.map { |permutation|
    Tour.new(permutation)
  }
end

def exact_tsp(cities)
  shortest(all_tours(cities))
end

def shortest(tours)
  tours.min_by(&:distance)
end


tour = exact_tsp(cities8)

puts tour.cities
puts tour.distance

