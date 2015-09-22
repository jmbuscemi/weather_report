require 'httparty'

class TenDayForecast

  def initialize(location)
    @location = location
    @forecast = get_data
  end

#Refactor using -  Day | Description | Low Temp | High Temp
#Need to think about hash/array structure below four output.
  def display
    array = @forecast["forecast"]["simpleforecast"]["forecastday"]
    output = array.map do |d|
      "#{d["date"]["weekday_short"].upcase} #{d["date"]["year"]}-#{d["date"]["month"]}-#{d["date"]["day"]} || #{d["conditions"]} | Low = #{d["low"]["fahrenheit"]} | High = #{d["high"]["fahrenheit"]}"
    end
  end

  private def get_data
    # if @location.match(/\d{5}/)
    #   HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{@location}.json")
    # else
    #   state = @location.split(/[\s,]+/)[-1]
    #   city = @location.split(/[\s,]+/)[0..-2].join('_')
    #   HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{state}/#{city}.json")
    # end
    JSON.parse(File.read("./test_input/forecast10day.json"))
  end

end
