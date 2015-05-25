require 'httparty'

class SunriseSunsetTime

  def initialize(zip, type)
    @astronomy = get_data
    @type = type
  end

  def get_sun_times
    rise_hour = @astronomy["sun_phase"]["sunrise"]["hour"]
    rise_minute = @astronomy["sun_phase"]["sunrise"]["minute"]

    set_hour = @astronomy["sun_phase"]["sunset"]["hour"]
    set_minute = @astronomy["sun_phase"]["sunset"]["minute"]

    if @type == "sunrise"
      "Sunrise: #{rise_hour}:#{rise_minute}AM (local time)"
    else
      "Sunset: #{set_hour.to_i - 12}:#{set_minute}PM (local time)"
    end
  end

  private def get_data
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip}.json")
  end

end

##Output display
#TO DELETE
# a = SunriseSunsetTime.new(27954)
# a.get_sun_times
