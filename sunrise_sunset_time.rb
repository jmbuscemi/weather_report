require 'httparty'

class SunriseSunsetTime

  def initialize(zip)
    @astronomy = HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{zip}.json")
  end

  def get_sun_times
    rise_hour = @astronomy["moon_phase"]["sunrise"]["hour"]
    rise_minute = @astronomy["moon_phase"]["sunrise"]["minute"]

    set_hour = @astronomy["moon_phase"]["sunset"]["hour"]
    set_minute = @astronomy["moon_phase"]["sunset"]["minute"]

    p "Sunrise: #{rise_hour}:#{rise_minute}AM (local time)"
    p "Sunset: #{set_hour.to_i - 12}:#{set_minute}PM (local time)"
  end

end

##Output display
#TO DELETE
# a = SunriseSunsetTime.new(27954)
# a.get_sun_times
