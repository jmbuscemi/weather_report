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
zip = report.zipcode.to_i

summary = CurrentCondition.new(zip)
forecast = TenDayForecast.new(zip)
sunrise = SunriseSunsetTime.new(zip, "sunrise")
sunset = SunriseSunsetTime.new(zip, "sunset")
alert = CurrentAlert.new(zip)
hurricane = ActiveHurricane.new

big_header
puts "               ******** Current Conditions ********               "
puts "Location: #{summary.location}"
puts "Temp: #{summary.current_temp}F"
puts "Feels like: #{summary.feels_like.to_i}F"
puts "Wind: #{summary.wind_dir} @ #{summary.wind_speed}mph "
big_header
puts "               ********   10 Day Forecast  ********               "
forecast.get_forecast
big_header
puts "               ********  Sunrise / Sunset  ********               "
sunrise.get_sun_times
sunset.get_sun_times
big_header
puts "               ********       Alerts       ********               "
alert.get_alert
big_header
puts "               ********  Active Hurricanes ********               "
hurricane.get_hurricane
big_header