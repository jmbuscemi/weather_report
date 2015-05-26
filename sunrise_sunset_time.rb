require 'httparty'

class SunriseSunsetTime
  attr_reader :sun_time

  def initialize(zip, type)
    @zip = zip
    @type = type
    @astronomy = get_data
  end

  def get_sun_times

    rise_hour = @astronomy["sun_phase"]["sunrise"]["hour"]
    rise_minute = @astronomy["sun_phase"]["sunrise"]["minute"]
    set_hour = @astronomy["sun_phase"]["sunset"]["hour"]
    set_minute = @astronomy["sun_phase"]["sunset"]["minute"]

    if @type == "sunrise"
      @sun_time = "Sunrise: #{rise_hour}:#{rise_minute}AM (local time)"
      puts @sun_time
      @sun_time
    else
      @sun_time = "Sunset: #{set_hour.to_i - 12}:#{set_minute}PM (local time)"
      puts @sun_time
      @sun_timec
    end
  end

  private def get_data
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/astronomy/q/#{@zip}.json")
  end

end
