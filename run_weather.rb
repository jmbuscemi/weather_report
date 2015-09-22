require 'json'

require './weather_report'
require './current_condition'
require './ten_day_forecast'
require './sunrise_sunset_time'
require './active_hurricane'
require './current_alert'

def big_header
  puts "=================================================================="
end

report = WeatherReport.new()
# zip = report.zipcode.to_i
location = report.location

summary = CurrentCondition.new(location)
forecast = TenDayForecast.new(location)
sunrise = SunriseSunsetTime.new(location, "sunrise")
sunset = SunriseSunsetTime.new(location, "sunset")
alert = CurrentAlert.new(location)
hurricane = ActiveHurricane.new

big_header
puts "               ******** Current Conditions ********               "
puts "Location: #{summary.city_state}"
puts "Temp: #{summary.current_temp}F"
puts "Feels like: #{summary.feels_like.to_i}F"
puts "Wind: #{summary.wind_dir} @ #{summary.wind_speed}mph "
big_header
puts "               ********   10 Day Forecast  ********               "
forecast.display.each {|day| p day}
big_header
puts "               ********  Sunrise / Sunset  ********               "
sunrise.display_time
sunset.display_time
big_header
puts "               ********       Alerts       ********               "
alert.display.each {|alert| puts alert}
big_header
puts "               ********  Active Hurricanes ********               "
hurricane.get_hurricane
big_header
