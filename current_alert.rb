require 'httparty'

class CurrentAlert
  attr_reader :alert_type

  def initialize(location)
    @location = location
    @alert = get_data
  end

  def get_alert
    array = []
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
    if @location.match(/\d{5}/)
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{@location}.json")
    else
      state = @location.split(/[\s,]+/)[-1]
      city = @location.split(/[\s,]+/)[0..-2].join('_')
      HTTParty.get("https://api.wunderground.com/api/#{ENV["WUNDERGROUND_KEY"]}/alerts/q/#{state}/#{city}.json")
    end
  end

end
