require "pry"
require "./city.rb"

srand

cities8, cities10, cities100, cities1000 =
  [8, 10, 100, 1000].map { |n|
    City.random_cities(n)
  }

binding.pry
