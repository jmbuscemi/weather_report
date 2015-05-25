require 'httparty'

class CurrentAlert
  attr_reader :alert_type

  def initialize(zip)
    @alert = get_data
  end

  def get_alert
    array = @alert["alerts"]

    if array == []
      puts "There are no current alerts for your area."
      @alert_type = "NONE"
    else
      array.each do |d|
        puts "ALERT: #{d["description"]} /// Expires on: #{d["expires"]}"
      @alert_type = "ALERT: #{d["description"]}"
      end
    end
    @alert_type
  end

  private def get_data
    HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{zip}.json")
  end

end
