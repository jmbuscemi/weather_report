require 'httparty'

class CurrentCondition

  def initialize(location)
    @location = location
    @conditions = get_data
  end

  def city_state
    @conditions["current_observation"]["display_location"]["full"]
  end

  def current_temp
    @conditions["current_observation"]["temp_f"]
  end

  def feels_like
    @conditions["current_observation"]["feelslike_f"]
  end

  def wind_dir
    @conditions["current_observation"]["wind_dir"]
  end

  def wind_speed
    @conditions["current_observation"]["wind_mph"]
  end

  private def get_data
    if @location.match(/\d{5}/)
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{@location}.json")
    else
      state = @location.split(/[\s,]+/)[-1]
      city = @location.split(/[\s,]+/)[0..-2].join('_')
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{state}/#{city}.json")
    end
  end

end
