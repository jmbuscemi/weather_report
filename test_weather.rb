# Basic test requires
require 'minitest/autorun'
require 'minitest/pride'
require 'json'

require './weather_report'
require './current_condition'
require './ten_day_forecast'
require './sunrise_sunset_time'
require './active_hurricane'
require './current_alert'

#FROM MINI LECTURE
class CurrentCondition
  private def get_data
    JSON.parse(File.open("current_conditions.json").read)
  end
end

class TenDayForecast
  private def get_data
    JSON.parse(File.open("forecast10day.json").read)
  end
end

class SunriseSunsetTime
  private def get_data
    JSON.parse(File.open("astronomy.json").read)
  end
end

class CurrentAlert
  private def get_data
    JSON.parse(File.open("alert.json").read)
  end
end

class ActiveHurricane
  private def get_data
    JSON.parse(File.open("hurricane.json").read)
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

  def test_get_user_input
    random = rand(99999)+1
    report = WeatherReport.new(random)

    assert_equal random, report.zipcode
  end

  def test_get_current_conditions
    report = WeatherReport.new(27954)
    summary = CurrentCondition.new(report.zipcode)

    assert_equal "Manteo, NC", summary.location
    assert_equal 71.1, summary.current_temp
    assert_equal "71.1", summary.feels_like
    assert_equal 4.3 ,summary.wind_speed
    assert_equal "East" ,summary.wind_dir
  end

  def test_get_10_day_forecast
    report = WeatherReport.new(27954)
    forecast = TenDayForecast.new(report.zipcode)

    assert_equal forecast.get_forecast, "Clear"
  end

  def test_get_sun_time
    report = WeatherReport.new(27954)
    sun_time = SunriseSunsetTime.new(report.zipcode, "sunrise")
    assert sun_time.get_sun_times.match(/5\:52/)

    sun_time = SunriseSunsetTime.new(report.zipcode, "sunset")
    assert sun_time.get_sun_times.match(/8\:06/)
  end

  def test_alert
    report = WeatherReport.new(76301)
    alert = CurrentAlert.new(report.zipcode)

    assert_equal alert.get_alert, "ALERT: Areal Flood Advisory, Flash Flood Watch"
  end

  def test_hurricane
    hurricane = ActiveHurricane.new

    assert_equal hurricane.get_hurricane, "Invest 90E"
  end




end
