require "pry"
require "./city.rb"
require "./tour.rb"

srand(0)

cities8, cities10, cities100, cities1000 =
  [8, 10, 100, 1000].map { |n|
    City.random_cities(n)
  }

def all_tours(cities)
  start = cities.first
  (cities - [start]).permutation.map { |permutation|
    Tour.new([start] + permutation)
  }
end

def exact_tsp(cities)
  shortest(all_tours(cities))
end

def shortest(tours)
  tours.min_by(&:distance)
end


tour = exact_tsp(cities8)

tour.plot
