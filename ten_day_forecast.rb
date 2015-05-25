require 'httparty'

class TenDayForecast
  attr_reader :forecast

  def initialize(zip)
    @forecast = get_data
  end

#Refactor using -  Day | Description | Low Temp | High Temp
#Need to think about hash/array structure below four output.
  def get_forecast
    array = @forecast["forecast"]["simpleforecast"]["forecastday"]
    array.each do |d|
      puts "#{d["title"]} - #{d["fcttext"]}"
    end
  end

  private def get_data
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{zip}.json")
  end

end

##Output display
#TO DELETE
# a = TenDayForecast.new(27701)
# a.get_forecast
