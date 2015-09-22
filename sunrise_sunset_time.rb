require 'httparty'

class SunriseSunsetTime

  def initialize(location, type)
    @location = location
    @type = type
    @astronomy = get_data
  end

  def display_time
    rise_hour = @astronomy["sun_phase"]["sunrise"]["hour"]
    rise_minute = @astronomy["sun_phase"]["sunrise"]["minute"]
    set_hour = @astronomy["sun_phase"]["sunset"]["hour"]
    set_minute = @astronomy["sun_phase"]["sunset"]["minute"]

    if @type == "sunrise"
      "Sunrise: #{rise_hour}:#{rise_minute}AM (local time)"
      # byebug
    else
      "Sunset: #{set_hour.to_i - 12}:#{set_minute}PM (local time)"
    end
  end

  private def get_data
    if @location.match(/\d{5}/)
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{@location}.json")
    else
      state = @location.split(/[\s,]+/)[-1]
      city = @location.split(/[\s,]+/)[0..-2].join('_')
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{state}/#{city}.json")
    end
  end

end
