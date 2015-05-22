require 'httparty'

class TenDayForecast
  attr_reader :forecast

  def initialize(zip)
    @forecast = HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/zmw:#{zip}.1.99999.json")
  end

  def get_forecast
    forecast_array = @forecast["forecast"]["txt_forecast"]["forecastday"]

    forecast_array.each do |d|
      p "#{d["title"]} #{d["fcttext"]}"
    end
  end


end

##Output display
#TO DELETE
# a = TenDayForecast.new(27701)
# a.get_forecast
