require 'httparty'

class WeatherReport
  attr_reader :zipcode

  def initialize(zip = nil)
    if zip
      @zipcode = zip
    else
      p "Enter weather location (zipcode): "
      @zipcode = gets.chomp
    end
  end

end
