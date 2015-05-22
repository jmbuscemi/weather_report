# Basic test requires
require 'minitest/autorun'
require 'minitest/pride'

require './weather_report'
require './current_condition'
require './ten_day_forecast.rb'
require './sunrise_sunset_time.rb'
require './active_hurricane.rb'
require './current_alert.rb'

class WeatherReportTest < Minitest::Test

  def test_truth
    assert true
  end

  def test_weather_classes_exists
    assert WeatherReport
    assert CurrentCondition
    assert TenDayForecast
    assert SunriseSunsetTime
    assert CurrentAlert
    assert ActiveHurricane
  end

  def test_get_user_input
    random = rand(99999)+1
    report = WeatherReport.new(random)

    assert_equal random, report.zipcode
  end

  # def test_get_current_conditions
  #   report = WeatherReport.new(27954)
  #   summary = CurrentCondition.new(report.zipcode)
  #
  #   assert_equal "Manteo, NC", summary.location
  #   assert_in_delta 75, summary.current_temp, 50
  # end

  # def test_get_10_day_forecast
  #   report = WeatherReport.new(27954)
  #   forecast = TenDayForecast.new(report.zipcode)
  #
  #   forecast.get_forecast
  # end

  # def test_sunrise_sunset_times
  #   report = WeatherReport.new(27954)
  #   suntimes = SunriseSunsetTime.new(report.zipcode)
  #
  #   suntimes.get_sun_times
  # end

  # def test_alert
  #   report = WeatherReport.new(27954)
  #   alert = CurrentAlert.new(report.zipcode)
  #
  #   alert.get_alert
  # end

end
