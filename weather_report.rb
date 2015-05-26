require 'httparty'

class WeatherReport
  attr_reader :zipcode

  def initialize(zip = nil)
    if zip
      @zipcode = zip
    else
      p "Enter weather location (City, State OR Zipcode): "
      @zipcode = gets.chomp
    end
  end

end
