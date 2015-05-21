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

  def test_get_current_conditions
    report = WeatherReport.new(27954)
    summary = CurrentCondition.new(report.zipcode)

    assert_equal "Manteo, NC", summary.location
    assert_in_delta 75, summary.current_temp, 50
  end

end
