require 'httparty'

class WeatherReport
  attr_reader :location

  def initialize(location = nil)
    if location
      @location = location
    else
      p "Enter weather location (City, State OR Zipcode): "
      @location = gets.chomp
    end
  end

end
