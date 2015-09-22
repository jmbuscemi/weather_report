# Basic test requires
require 'minitest/autorun'
require 'minitest/pride'
require 'json'
require 'byebug'

require './weather_report'
require './current_condition'
require './ten_day_forecast'
require './sunrise_sunset_time'
require './active_hurricane'
require './current_alert'

class CurrentCondition
  private def get_data
    JSON.parse(File.read("./test_input/current_conditions.json"))
  end
end

class TenDayForecast
  private def get_data
    JSON.parse(File.read("./test_input/forecast10day.json"))
  end
end

class SunriseSunsetTime
  private def get_data
    JSON.parse(File.read("./test_input/astronomy.json"))
  end
end

class CurrentAlert
  private def get_data
    JSON.parse(File.read("./test_input/alert.json"))
  end
end

class ActiveHurricane
  private def get_data
    JSON.parse(File.read("./test_input/hurricane.json"))
  end
end


class WeatherReportTest < Minitest::Test

  def test_weather_classes_exists
    assert WeatherReport
    assert CurrentCondition
    assert TenDayForecast
    assert SunriseSunsetTime
    assert CurrentAlert
    assert ActiveHurricane
  end

  def test_report_can_display_location
    random = rand(99999)+1
    report = WeatherReport.new(random)

    assert_equal random, report.location
  end

  def test_get_current_conditions
    report = WeatherReport.new(27954)
    summary = CurrentCondition.new(report.location)

    assert_equal "Manteo, NC", summary.city_state
    assert_equal 71.1, summary.current_temp
    assert_equal "71.1", summary.feels_like
    assert_equal 4.3 ,summary.wind_speed
    assert_equal "East" ,summary.wind_dir
  end

  def test_get_10_day_forecast
    report = WeatherReport.new(27954)
    forecast = TenDayForecast.new(report.location)
    assert forecast.display.last.match(/(Clear)/)
  end

  def test_get_sun_time
    report = WeatherReport.new(27954)
    sunrise = SunriseSunsetTime.new(report.location, "sunrise")
    assert sunrise.display_time.match(/5\:52/)

    sunset = SunriseSunsetTime.new(report.location, "sunset")
    assert sunset.display_time.match(/8\:06/)
  end

  def test_alert
    report = WeatherReport.new(76301)
    alert = CurrentAlert.new(report.location)
    assert alert.display.last.match(/(Flood)/)
    # assert_equal "ALERT: Areal Flood Advisory, Flash Flood Watch /// Expires on: 7:00 AM CDT on May 25, 2015", alert.display.last
  end

  def test_hurricane
    hurricane = ActiveHurricane.new

    assert_equal "Invest 90E", hurricane.get_hurricane
  end
end
