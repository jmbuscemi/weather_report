require 'httparty'

class CurrentAlert < WeatherReport

  def initialize(location)
    @location = location
    @alert = get_data
  end

  def display
    array = @alert["alerts"]
    return "No alerts in your Area" if array == []
    output = array.map do |d|
      "ALERT: #{d["description"]} /// Expires on: #{d["expires"]}"
    end
  end

  private def get_data
    if @location.match(/\d{5}/)
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{@location}.json")
    else
      state = @location.split(/[\s,]+/)[-1]
      city = @location.split(/[\s,]+/)[0..-2].join('_')
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{state}/#{city}.json")
    end
  end

end
