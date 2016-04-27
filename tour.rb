require "nokogiri"

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

  def plot(filename = Time.now.to_s)
    builder = Nokogiri::XML::Builder.new do |doc|
      doc.svg xmlns:"http://www.w3.org/2000/svg", viewBox:"0 0 900 600" do
        plot_points(doc)
        plot_paths(doc)
      end
    end
    File.write(filename + ".svg", builder.to_xml)
  end

  private

  def plot_paths(doc)
    path_data = (cities + [cities.first]).map { |city|
      "#{city.complex.real} #{city.complex.imaginary}"
    }.join(" L ")
    path_data = "M #{path_data} z"
    doc.path(
      d: path_data, stroke: "red", "stroke_width" => 3,
      fill: "none"
    )
  end

  def plot_points(doc)
    cities.each do |city|
      doc.circle(
        r: 3,
        cx: city.complex.real,
        cy: city.complex.imaginary
      )
    end
  end
end
