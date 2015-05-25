require 'httparty'

class SunriseSunsetTime
  attr_reader :sun_time

  def initialize(zip, type)
    @zip = zip
    @astronomy = HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{@zip}.json")
    @type = type
  end

  def get_sun_times

    rise_hour = @astronomy["sun_phase"]["sunrise"]["hour"]
    rise_minute = @astronomy["sun_phase"]["sunrise"]["minute"]
    set_hour = @astronomy["sun_phase"]["sunset"]["hour"]
    set_minute = @astronomy["sun_phase"]["sunset"]["minute"]

    if @type == "sunrise"
      puts "Sunrise: #{rise_hour}:#{rise_minute}AM (local time)"
    else
      puts "Sunset: #{set_hour.to_i - 12}:#{set_minute}PM (local time)"
    end
  end

  # private def get_data
  #   HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{@zip}.json")
  # end

end
