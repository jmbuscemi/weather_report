require 'httparty'

class CurrentCondition
  attr_reader :conditions

  def initialize(zip)
    @conditions = HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/conditions/q/#{zip}.json")
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

end

##Output display
#TO DELETE
# summary = CurrentCondition.new(27954)
#
# p "In #{summary.location} it is currently #{summary.current_temp}F"
# p "It feels like #{summary.feels_like}"
# p "The wind is blowing #{summary.wind_speed}mph out of the #{summary.wind_dir}"
