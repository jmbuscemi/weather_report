require 'httparty'

class CurrentCondition
  attr_reader :conditions

  def initialize(zip)
    @conditions = get_data
  end

  def location
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
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
  end

end
