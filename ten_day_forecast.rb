require 'httparty'

class TenDayForecast
  attr_reader :forecast_condition

  def initialize(zip)
    @zip = zip
    @forecast = get_data
  end

#Refactor using -  Day | Description | Low Temp | High Temp
#Need to think about hash/array structure below four output.
  def get_forecast
    array = @forecast["forecast"]["simpleforecast"]["forecastday"]
    array.each do |d|
      p "#{d["date"]["weekday_short"].upcase} #{d["date"]["year"]}-#{d["date"]["month"]}-#{d["date"]["day"]} || #{d["conditions"]} | Low = #{d["low"]["fahrenheit"]} | High = #{d["high"]["fahrenheit"]}"
      @forecast_condition = "#{d["conditions"]}"
    end
    @forecast_condition
  end

  private def get_data
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{@zip}.json")
  end

end
