require 'httparty'

class TenDayForecast
  attr_reader :forecast

  def initialize(zip)
    @forecast = HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/zmw:#{zip}.1.99999.json")
  end

#NEXT IS TO MAKE 10 DAY FORECAST DISPLAY INFO
end
